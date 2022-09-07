// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Olympus } from "src/Olympus.sol";
import { MerakiToken } from "src/MerakiToken.sol";
import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";

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
        founderBalances[1] = 25_000;
        founderBalances[2] = 25_000;
        founderBalances[3] = 25_000;
        founderBalances[4] = 10_000;

        olympus = new Olympus(meraki, WETH, founders, founderBalances);

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
    }

    function testClaimingRewards(uint8 amount) external {
        amount = uint8(bound(amount, 1, 100));
        uint256[] memory ids = new uint256[](amount);
        for (uint256 i = 0; i < amount; i++) {
            ids[i] = startIndex + i;
        }
        // Give this address some WETH to deposit as rewards.
        uint256 rewardAmount = 1e18;
        deal(address(WETH), address(this), 3 * rewardAmount);
        olympus.depositReward(rewardAmount);

        olympus.stake(ids);

        assertEq(olympus.pendingRewards(address(this)), 0, "Pending rewards should equal zero.");

        olympus.depositReward(rewardAmount);

        uint256 totalDeposited = olympus.totalAmountDeposited();

        // Even though user left they can still claim rewards.
        olympus.unstake(amount);

        uint256 expectedReward = (rewardAmount * amount) / totalDeposited;
        assertApproxEqRel(
            olympus.pendingRewards(address(this)),
            expectedReward,
            1e12,
            "Pending rewards should be approximately equal to expected reward."
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

    function testDepositReward() external {}

    function testPause() external {}

    function testAdjustingFoudnerCuts() external {}

    function testTransfers() external {
        //should fail
    }

    // Integration test
    function testMultipleUsers() external {}
}
