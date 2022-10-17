// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Olympus, RewardDistributor } from "src/Olympus.sol";
import { MerakiToken } from "src/MerakiToken.sol";
import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import { ReentrancyAttacker } from "src/mocks/ReentrancyAttacker.sol";

import { Test, stdStorage, console, StdStorage, stdError } from "@forge-std/Test.sol";

contract OlympusTest is Test, ERC721Holder {
    Olympus private olympus;

    address[] private founders = new address[](5);
    uint256[] private founderBalances = new uint256[](5);

    uint256 private startIndex = 2_000;
    uint256 private lastIndex = 2_999;

    // Contracts on Polygon Mainnet
    ERC20 private WETH = ERC20(0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619);
    MerakiToken private meraki = MerakiToken(0xD6faC20553F169290EE8D26144dF68f9e989f84f);
    address private merakiTokenOwner = 0x15dE9627D4376f2533ca3e41b10F47209F4ed950; // This is the timelock contract.
    address private merakiTokenWhale = 0x7031BC57E774e0d81780677F53AfD79F23a81a94; // Useful to get some tokens for testing.

    function setUp() public {
        // Set up founder array.
        founders[0] = vm.addr(1);
        founders[1] = vm.addr(2);
        founders[2] = vm.addr(3);
        founders[3] = vm.addr(4);
        founders[4] = vm.addr(5);

        // Set up balances array.
        founderBalances[0] = 15_000;
        founderBalances[1] = 15_000;
        founderBalances[2] = 25_000;
        founderBalances[3] = 25_000;
        founderBalances[4] = 10_000;

        olympus = new Olympus(meraki, WETH, founders, founderBalances, 1);

        // Give this address some Meraki tokens to work with.
        vm.startPrank(merakiTokenWhale);
        for (uint256 i = 2_000; i < 2_100; i++) {
            meraki.transferFrom(merakiTokenWhale, address(this), i);
        }
        vm.stopPrank();

        meraki.setApprovalForAll(address(olympus), true);
        WETH.approve(address(olympus), type(uint256).max);
    }

    function testStakeAndUnstake(uint8 amount) external {
        amount = uint8(bound(amount, 1, 100));
        uint256[] memory ids = new uint256[](amount);
        for (uint256 i = 0; i < amount; i++) {
            ids[i] = startIndex + i;
        }

        uint256 totalDepositBefore = olympus.totalAmountDeposited();

        // Stake full amount of NFTs.
        olympus.stake(ids);
        assertEq(olympus.balanceOf(address(this)), amount, "Olympus balance should equal amount.");
        assertEq(olympus.DAOVotingPower(address(this)), amount, "DAO Voting power should equal amount.");
        assertEq(
            olympus.totalAmountDeposited(),
            totalDepositBefore + amount,
            "Total deposit should equal prior amount + users deposit."
        );
        assertEq(olympus.usersNFTs(address(this)).length, amount, "User NFT array should have amount length.");

        // Unstake the full amount of NFTs.
        olympus.unstake(amount);
        assertEq(olympus.balanceOf(address(this)), 0, "Olympus balance should be zero.");
        assertEq(olympus.DAOVotingPower(address(this)), 0, "DAO Voting power should be zero.");
        assertEq(olympus.totalAmountDeposited(), totalDepositBefore, "Total deposit should equal prior amount.");

        // Check reward logic makes sense.
        assertEq(olympus.rewardOwed(address(this)), 0, "Reward owed should be zero since nothing was deposited.");
        assertEq(
            olympus.rewardCountLastClaim(address(this)),
            0,
            "Last claim should be zero since nothing was deposited."
        );

        uint256[] memory emptyIds;

        vm.expectRevert(abi.encodeWithSelector(Olympus.Olympus__ZeroInput.selector));
        olympus.stake(emptyIds);

        vm.expectRevert(abi.encodeWithSelector(Olympus.Olympus__ZeroInput.selector));
        olympus.unstake(0);

        vm.expectRevert(bytes("ERC20: burn amount exceeds balance"));
        olympus.unstake(1);
    }

    function testClaimingRewards(uint8 amount, uint256 rewardAmount) external {
        amount = uint8(bound(amount, 1, 100));
        uint256[] memory ids = new uint256[](amount);
        for (uint256 i = 0; i < amount; i++) {
            ids[i] = startIndex + i;
        }
        // Give this address some WETH to deposit as rewards.
        rewardAmount = bound(rewardAmount, 1e6, type(uint112).max);
        deal(address(WETH), address(this), 3 * rewardAmount);
        olympus.depositReward(rewardAmount);

        olympus.stake(ids);

        assertEq(olympus.pendingRewards(address(this)), 0, "Pending rewards should equal zero.");

        olympus.depositReward(rewardAmount);

        uint256 totalDeposited = olympus.totalAmountDeposited();

        // Even though user left they can still claim rewards.
        olympus.unstake(amount);

        uint256 expectedReward = (rewardAmount * amount) / totalDeposited;
        assertEq(
            olympus.pendingRewards(address(this)),
            expectedReward,
            "Pending rewards should be equal to expected reward."
        );
        uint256 reward = olympus.pendingRewards(address(this));
        assertEq(reward, olympus.claimRewards(address(this)), "Pending rewards should equal claimed rewards.");

        assertEq(olympus.pendingRewards(address(this)), 0, "Pending rewards should be zero.");
        assertEq(olympus.rewardOwed(address(this)), 0, "`rewardOwed` should be zero.");
        assertEq(
            olympus.rewardCountLastClaim(address(this)),
            olympus.rewardCount() - 1,
            "Should have upadted last claim to current."
        );

        // Since user left future rewards should not accrue for them.
        olympus.depositReward(rewardAmount);
        assertEq(olympus.pendingRewards(address(this)), 0, "Pending rewards should be zero.");

        assertEq(WETH.balanceOf(address(this)), reward, "Rewards should have been sent to user.");

        // User should not be able to unstake anymore tokens.
        vm.expectRevert(bytes("ERC20: burn amount exceeds balance"));
        olympus.unstake(1);

        // Check to see what happens even if a user somehow gets an extra Olympus token.
        deal(address(olympus), address(this), 1);
        vm.expectRevert(stdError.indexOOBError);
        olympus.unstake(1);
    }

    function testSetPayoutAddress(uint8 amount) external {
        amount = uint8(bound(amount, 1, 100));
        uint256[] memory ids = new uint256[](amount);
        for (uint256 i = 0; i < amount; i++) {
            ids[i] = startIndex + i;
        }
        // Give this address some WETH to deposit as rewards.
        uint256 rewardAmount = 1e18;
        deal(address(WETH), address(this), 2 * rewardAmount);

        olympus.stake(ids);

        olympus.depositReward(rewardAmount);

        // User changes payout address.
        address newPayout = vm.addr(777);
        olympus.setPayoutTo(newPayout);

        uint256 reward = olympus.claimRewards(address(this));
        assertEq(WETH.balanceOf(newPayout), reward, "Rewards should have been sent to new address.");
    }

    function testDepositReward(uint256 rewardAmount) external {
        // Give this address some WETH to deposit as rewards.
        rewardAmount = bound(rewardAmount, 1e6, type(uint112).max);
        deal(address(WETH), address(this), 2 * rewardAmount);
        olympus.depositReward(rewardAmount);
        olympus.depositReward(rewardAmount);

        assertEq(olympus.rewardCount(), 3, "Reward count should have been incremented.");

        assertEq(olympus.cumulativeRewardShare(0), 0, "First reward share should be zero.");

        uint256 expectedRewardShare = (1e18 * rewardAmount) / olympus.totalAmountDeposited();
        assertEq(olympus.cumulativeRewardShare(1), expectedRewardShare, "Second reward share should equal expected.");

        expectedRewardShare += (1e18 * rewardAmount) / olympus.totalAmountDeposited();
        assertEq(olympus.cumulativeRewardShare(2), expectedRewardShare, "Third reward share should equal expected.");
    }

    function testPause() external {
        // Pause the contract.
        olympus.Pause();
        assertTrue(olympus.paused(), "Contract should be paused.");

        uint256[] memory ids;
        vm.expectRevert(bytes("Pausable: paused"));
        olympus.stake(ids);

        vm.expectRevert(bytes("Pausable: paused"));
        olympus.depositReward(0);

        vm.expectRevert(bytes("Pausable: paused"));
        olympus.claimRewards(address(0));

        // Make sure we can unpause.
        olympus.unPause();
        assertTrue(!olympus.paused(), "Contract should not be paused.");
    }

    function testAdjustingFounderCuts() external {
        address[] memory newFounders = new address[](2);
        uint256[] memory newBalances = new uint256[](2);
        newFounders[0] = vm.addr(1234);
        newFounders[1] = vm.addr(12345);
        newBalances[0] = 45_000;
        newBalances[1] = 45_000;

        uint256 oldCap = olympus.founderDepositCap();

        // Add some rewards so that old founders have rewards to claim.
        uint256 rewardAmount = 10e18;
        deal(address(WETH), address(this), rewardAmount);
        olympus.depositReward(rewardAmount);

        uint256 totalDeposit = olympus.totalAmountDeposited();

        address[] memory oldFounderList = olympus.getFounderList();
        olympus.adjustFounderInfo(newFounders, newBalances, false);

        assertEq(olympus.founderDepositCap(), oldCap, "Founder deposit cap should no have changed.");

        address[] memory founderList = olympus.getFounderList();
        for (uint256 i = 0; i < founderList.length; i++) {
            assertEq(founderList[i], newFounders[i], "Olympus founderList should  have been updated to new list.");
            assertEq(
                olympus.founderBalance(founderList[i]),
                newBalances[i],
                "New Founder balances should have been set to newBalances."
            );
        }

        for (uint256 i = 0; i < oldFounderList.length; i++) {
            assertEq(
                olympus.founderBalance(oldFounderList[i]),
                0,
                "Old Founder balances should have been  set to zero."
            );
            uint256 expectedPending = (rewardAmount * founderBalances[i]) / olympus.totalAmountDeposited();
            assertEq(
                olympus.pendingRewards(founders[i]),
                expectedPending,
                "Old founders should still have pending rewards to claim."
            );
        }

        assertEq(olympus.totalAmountDeposited(), totalDeposit, "Total deposit should remain constant.");

        // Add one of the original founders back in, and reduce founder deposit cap.
        newFounders = new address[](3);
        newBalances = new uint256[](3);
        newFounders[0] = vm.addr(1234);
        newFounders[1] = vm.addr(12345);
        newFounders[2] = founders[0];
        newBalances[0] = 25_000;
        newBalances[1] = 25_000;
        newBalances[2] = 25_000;

        vm.expectRevert(abi.encodeWithSelector(Olympus.Olympus__WrongFounderBalanceTotal.selector, 75_000, oldCap));
        olympus.adjustFounderInfo(newFounders, newBalances, false);

        oldFounderList = olympus.getFounderList();
        olympus.adjustFounderInfo(newFounders, newBalances, true);

        founderList = olympus.getFounderList();
        for (uint256 i = 0; i < founderList.length; i++) {
            assertEq(founderList[i], newFounders[i], "Olympus founderList should  have been updated to new list.");
            assertEq(
                olympus.founderBalance(founderList[i]),
                newBalances[i],
                "New Founder balances should have been set to newBalances."
            );
        }
        uint256 expectedTotalDeposit = newBalances[0] + newBalances[1] + newBalances[2];
        assertEq(olympus.totalAmountDeposited(), expectedTotalDeposit, "Total deposit should decrease.");

        // Check remaining revert messages.
        newFounders = new address[](3);
        newBalances = new uint256[](2);
        vm.expectRevert(abi.encodeWithSelector(Olympus.Olympus__MisMatchedLengths.selector));
        olympus.adjustFounderInfo(newFounders, newBalances, false);

        newFounders = new address[](2);
        newBalances = new uint256[](2);
        vm.expectRevert(abi.encodeWithSelector(Olympus.Olympus__ZeroAddressFounder.selector));
        olympus.adjustFounderInfo(newFounders, newBalances, false);

        newFounders = new address[](1);
        newBalances = new uint256[](1);
        newFounders[0] = vm.addr(7777);
        newBalances[0] = 100_000;
        vm.expectRevert(abi.encodeWithSelector(Olympus.Olympus__WrongFounderBalanceTotal.selector, 100_000, 75_000));
        olympus.adjustFounderInfo(newFounders, newBalances, false);
    }

    function testTransfersRevert(uint8 amount) external {
        amount = uint8(bound(amount, 1, 100));
        uint256[] memory ids = new uint256[](amount);
        for (uint256 i = 0; i < amount; i++) {
            ids[i] = startIndex + i;
        }
        // Give this address some WETH to deposit as rewards.
        uint256 rewardAmount = 1e18;
        deal(address(WETH), address(this), 2 * rewardAmount);

        olympus.stake(ids);

        vm.expectRevert(abi.encodeWithSelector(RewardDistributor.RewardDistributor__TransfersNotAllowed.selector));
        olympus.transfer(vm.addr(777), 1);
    }

    function _checkFounderRewards(Olympus o, uint256 rewardsSinceLastClaim) internal {
        address[] memory f = o.getFounderList();
        for (uint256 i = 0; i < f.length; i++) {
            address founder = f[i];
            uint256 rewardBalanceBeforeClaim = o.rewardToken().balanceOf(founder);
            uint256 expectedReward = (rewardsSinceLastClaim * o.userBalance(founder)) / o.totalAmountDeposited();
            assertApproxEqAbs(
                o.pendingRewards(founder),
                expectedReward,
                1,
                "Founder pending reward should equal expected."
            );
            assertApproxEqAbs(
                o.pendingRewards(founder),
                o.claimRewards(founder),
                1,
                "Pending rewards should equal claimed rewards."
            );
            uint256 rewardBalanceAfterClaim = o.rewardToken().balanceOf(founder);
            assertApproxEqAbs(
                rewardBalanceAfterClaim - rewardBalanceBeforeClaim,
                expectedReward,
                1,
                "Founder should have been sent the expected reward."
            );
        }
    }

    function testFoundersClaimingRewards() external {
        uint256 rewardAmount = 1e18;
        deal(address(WETH), address(this), type(uint256).max);
        olympus.depositReward(rewardAmount);
        _checkFounderRewards(olympus, rewardAmount);

        // Founder 0 stakes their own Meraki Tokens.
        //amount = uint8(bound(amount, 1, 100));
        uint8 amount = 10;
        uint256[] memory ids = new uint256[](amount);
        for (uint256 i = 0; i < amount; i++) {
            ids[i] = startIndex + i;
            meraki.transferFrom(address(this), founders[0], ids[i]);
        }
        vm.startPrank(founders[0]);
        meraki.setApprovalForAll(address(olympus), true);
        olympus.stake(ids);
        uint256 expectedFounderBalance = founderBalances[0] + amount;
        assertEq(
            olympus.userBalance(founders[0]),
            expectedFounderBalance,
            "0th founder balance should equal expected."
        );
        vm.stopPrank();

        // Deposit some more rewards.
        uint8 iterations = 10;
        while (iterations > 0) {
            for (uint8 i = 0; i < iterations; i++) olympus.depositReward(rewardAmount);

            _checkFounderRewards(olympus, iterations * rewardAmount);

            iterations--;
        }
    }

    /**
     * @notice test DNOS where attacker spams Olympus with minimum reward deposit to prevent rewards being claimed by raising gas usage.
     */
    function testMaliciousRewardDeposit(uint256 amount) external {
        amount = uint8(bound(amount, 1, 100));
        uint256[] memory ids = new uint256[](amount);
        for (uint256 i = 0; i < amount; i++) {
            ids[i] = startIndex + i;
        }
        // Give this address some WETH to deposit as rewards.
        deal(address(WETH), address(this), type(uint256).max);

        // User joins.
        olympus.stake(ids);

        olympus.setMinimumRewardDeposit(0.01e18);

        // Minimum reward amount is currently 0.01 Reward Token.
        uint256 rewardAmount = 0.01e18;

        // Attacker first tries to attack depositing 0 wei rewards.
        vm.expectRevert(
            abi.encodeWithSelector(RewardDistributor.RewardDistributor__MinimumRewardDepositNotMet.selector)
        );
        olympus.depositReward(0);

        // Attacker spams Olympus with minimum reward deposits to try and stop users from claiming rewards.
        for (uint256 i = 0; i < 1_000; i++) {
            olympus.depositReward(rewardAmount);
        }
        uint256 startingGas = gasleft();
        olympus.claimRewards(address(this));
        uint256 gasUsed = startingGas - gasleft();

        assertEq(gasUsed, 58_086, "Gas used should be an O(1) operation and use constant gas.");
    }

    function _claim(address claimer) internal returns (uint256 claimed) {
        uint256 pending = olympus.pendingRewards(claimer);
        vm.prank(claimer);
        assertApproxEqAbs(pending, claimed = olympus.claimRewards(claimer), 1, "Pending should equal claimed.");
    }

    // Integration test
    function testMultipleUsers(
        uint8 amountA,
        uint8 amountB,
        uint8 amountC
    ) external {
        // Setup Meraki Balances.
        address alice = vm.addr(7777);
        address bob = vm.addr(77777);
        address bobAlt = vm.addr(111111);
        address sally = vm.addr(777777);

        // Values to store total amount claimed per user.
        uint256[] memory userClaims = new uint256[](3);

        amountA = uint8(bound(amountA, 10, type(uint8).max));
        uint256[] memory idsAlice = new uint256[](amountA);
        uint256 aliceStart = 3_000;
        for (uint256 i = 0; i < amountA; i++) {
            idsAlice[i] = aliceStart + i;
            vm.prank(merakiTokenWhale);
            meraki.transferFrom(merakiTokenWhale, alice, idsAlice[i]);
        }

        amountB = uint8(bound(amountB, 10, type(uint8).max));
        uint256[] memory idsBob = new uint256[](amountB);
        uint256 bobStart = 4_000;
        for (uint256 i = 0; i < amountB; i++) {
            idsBob[i] = bobStart + i;
            vm.prank(merakiTokenWhale);
            meraki.transferFrom(merakiTokenWhale, bob, idsBob[i]);
        }

        amountC = uint8(bound(amountC, 10, type(uint8).max));
        uint256[] memory idsSally = new uint256[](amountC);
        uint256 sallyStart = 5_000;
        for (uint256 i = 0; i < amountC; i++) {
            idsSally[i] = sallyStart + i;
            vm.prank(merakiTokenWhale);
            meraki.transferFrom(merakiTokenWhale, sally, idsSally[i]);
        }

        // Alice, Bob, and Sally deposit between 1 -> 255 Meraki tokens.
        vm.startPrank(alice);
        meraki.setApprovalForAll(address(olympus), true);
        olympus.stake(idsAlice);
        vm.stopPrank();

        vm.startPrank(bob);
        meraki.setApprovalForAll(address(olympus), true);
        olympus.stake(idsBob);
        olympus.setPayoutTo(bobAlt);
        vm.stopPrank();

        vm.startPrank(sally);
        meraki.setApprovalForAll(address(olympus), true);
        olympus.stake(idsSally);
        vm.stopPrank();

        {
            // Founder  0 stakes some meraki tokens.
            uint8 amount = 33;
            uint256[] memory ids = new uint256[](amount);
            for (uint256 i = 0; i < amount; i++) {
                ids[i] = startIndex + i;
                meraki.transferFrom(address(this), founders[0], ids[i]);
            }
            vm.startPrank(founders[0]);
            meraki.setApprovalForAll(address(olympus), true);
            olympus.stake(ids);
            vm.stopPrank();
        }

        deal(address(WETH), address(this), type(uint256).max);
        uint256 rewardAmount = 1e18;

        uint8 iterations = 10;
        while (iterations > 0) {
            for (uint8 i = 0; i < iterations; i++) {
                // Deposit some more rewards.
                olympus.depositReward(rewardAmount);

                // Alice claims rewards after every deposit.
                userClaims[0] += _claim(alice);

                // Bob claims occassionally.
                if (i % 3 == 0) {
                    userClaims[1] += _claim(bob);
                }

                // Sally does not claim rewards until the end.
            }

            _checkFounderRewards(olympus, iterations * rewardAmount);

            iterations--;
        }

        // Midway founders are updated to lower founder deposit cap.
        founderBalances[0] = 12_500;
        founderBalances[1] = 15_000;
        founderBalances[2] = 10_000;
        founderBalances[3] = 15_000;
        founderBalances[4] = 17_000;

        olympus.adjustFounderInfo(founders, founderBalances, true);

        //  More rewards are added and claimed.
        iterations = 10;
        while (iterations > 0) {
            for (uint8 i = 0; i < iterations; i++) {
                // Deposit some more rewards.
                olympus.depositReward(rewardAmount);

                // Alice claims rewards after every deposit.
                userClaims[0] += _claim(alice);

                // Bob claims occassionally.
                if (i % 3 == 0) {
                    userClaims[1] += _claim(bob);
                }

                // Sally does not claim rewards until the end.
            }

            _checkFounderRewards(olympus, iterations * rewardAmount);

            iterations--;
        }

        // Make sure Sally has claimed all rewards.
        userClaims[2] += olympus.claimRewards(sally);

        assertEq(WETH.balanceOf(alice), userClaims[0], "Alice WETH balance should equal total claimed.");
        assertEq(WETH.balanceOf(bob), 0, "Bob WETH balance should be zero.");
        assertEq(WETH.balanceOf(bobAlt), userClaims[1], "BobAlt WETH balance should equal total claimed.");
        assertEq(WETH.balanceOf(sally), userClaims[2], "Sally WETH balance should equal total claimed.");
        assertTrue(WETH.balanceOf(address(olympus)) < 1e6, "Olympus should have only have dust WETH left.");
    }

    function testDecimals() external {
        assertEq(olympus.decimals(), 0, "Olympus should report zero decimals.");
    }

    function testReentrancyAttack() external {
        ReentrancyAttacker attacker = new ReentrancyAttacker(ERC721(address(meraki)), olympus);

        uint8 amount = 10;
        uint256[] memory ids = new uint256[](amount);
        uint256 start = 3_000;
        for (uint256 i = 0; i < amount; i++) {
            ids[i] = start + i;
            vm.prank(merakiTokenWhale);
            meraki.transferFrom(merakiTokenWhale, address(attacker), ids[i]);
        }

        attacker.stake(ids);

        vm.expectRevert(bytes("ReentrancyGuard: reentrant call"));
        attacker.unstake(amount);
    }
}
