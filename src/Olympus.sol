// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import { ERC721Holder } from "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import { RewardDistributor, ERC20 } from "./RewardDistributor.sol";
import { EnumerableSet } from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

import { console } from "@forge-std/Test.sol";

contract Olympus is RewardDistributor, ERC721Holder {
    using EnumerableSet for EnumerableSet.UintSet;

    uint256 constant MAX_SUPPLY = 100_000;

    //user variables
    mapping(address => EnumerableSet.UintSet) userNFTIds;

    //founder variables
    mapping(address => uint256) public founderBalance;
    address[] public founderList;
    uint256 public founderDepositCap;

    //reward tracking
    uint256 public totalDeposits; //total amount of deposits in pool

    ERC721 private immutable MerakiToken;

    constructor(
        ERC721 _merakiToken,
        ERC20 _rewardToken,
        address[] memory _founders,
        uint256[] memory _balances,
        uint256 _minRewardDeposit
    ) RewardDistributor("Staked Meraki Token", "sMRKI", _rewardToken, _minRewardDeposit) {
        MerakiToken = _merakiToken;

        if (_founders.length != _balances.length) revert Olympus__MisMatchedLengths();
        uint256 _foundersCap = 0;
        founderList = _founders;
        for (uint256 i = 0; i < _founders.length; i++) {
            _foundersCap += _balances[i];
            founderBalance[founderList[i]] = _balances[i];
        }
        founderDepositCap = _foundersCap;
        totalDeposits = _foundersCap;
    }

    /****************************external onlyOwner *************************************/

    error Olympus__WrongFounderBalanceTotal(uint256 actual, uint256 expected);

    error Olympus__ZeroAddressFounder();

    error Olympus__MisMatchedLengths();

    /**
     * @notice Allows owner to adjust founder reward distribution.
     *         This only affects reward distributions and does not affect token distribution.
     * @notice total balance can NOT increase compared to previous.
     * @param _founders array of founder addresses
     * @param _balances array of balances corresponding to each founders reward share.
     * @param _lowerCap if true, then total balance can be lower than previous
     *                  else then total balance can NOT be lower than previous
     */
    function adjustFounderInfo(
        address[] memory _founders,
        uint256[] memory _balances,
        bool _lowerCap
    ) external onlyOwner {
        if (_founders.length != _balances.length) revert Olympus__MisMatchedLengths();

        // Reset old founders balances to zero.
        for (uint256 i = 0; i < founderList.length; i++) {
            _updateRewards(founderList[i]);
            founderBalance[founderList[i]] = 0;
        }

        uint256 total;
        for (uint256 i = 0; i < _founders.length; i++) {
            if (_founders[i] == address(0)) revert Olympus__ZeroAddressFounder();
            founderBalance[_founders[i]] = _balances[i];
            total += _balances[i];
        }

        if (total > founderDepositCap) revert Olympus__WrongFounderBalanceTotal(total, founderDepositCap);

        if (total < founderDepositCap) {
            if (!_lowerCap) revert Olympus__WrongFounderBalanceTotal(total, founderDepositCap);
            totalDeposits = totalDeposits - founderDepositCap + total;
            founderDepositCap = total;
        }

        // If all above checks pass, then update founderList.
        founderList = _founders;
    }

    /****************************external mutative *************************************/

    error Olympus__ZeroInput();

    /**
     * @notice allows users to stake Meraki tokens into olympus
     * @param _ids array of Meraki token Ids to stake
     */
    function stake(uint256[] memory _ids) external whenNotPaused nonReentrant {
        if (_ids.length == 0) revert Olympus__ZeroInput();
        //update reward info
        _updateRewards(msg.sender);
        for (uint256 i = 0; i < _ids.length; i++) {
            MerakiToken.safeTransferFrom(msg.sender, address(this), _ids[i], "");
            userNFTIds[msg.sender].add(_ids[i]);
        }
        totalDeposits += _ids.length;
        _mint(msg.sender, _ids.length);
    }

    /**
     * @notice allows users to unstake tokens from Olympus
     * @param _amount the amount of tokens to unstake
     */
    function unstake(uint256 _amount) external nonReentrant {
        if (_amount == 0) revert Olympus__ZeroInput();
        //update reward info
        _updateRewards(msg.sender);

        totalDeposits -= _amount;
        _burn(msg.sender, _amount);

        //send user their NFTs
        uint256 idToTransfer;
        for (uint256 i; i < _amount; i++) {
            idToTransfer = userNFTIds[msg.sender].at(0);
            userNFTIds[msg.sender].remove(idToTransfer);
            MerakiToken.safeTransferFrom(address(this), msg.sender, idToTransfer);
        }
    }

    /****************************public view *************************************/
    /**
     * @notice Get a users voting power
     * @notice founders have reduced voting power
     */
    function DAOVotingPower(address _user) public view returns (uint256) {
        return balanceOf(_user) + ((founderBalance[_user] * (MAX_SUPPLY - founderDepositCap)) / founderDepositCap); //account for founders reduced voting power
    }

    /**
     * @notice get an array of token ids a user has in Olympus
     */
    function usersNFTs(address _user) public view returns (uint256[] memory ids) {
        uint256 numOfNFTs = userNFTIds[_user].length();
        ids = new uint256[](numOfNFTs);
        for (uint256 i = 0; i < numOfNFTs; i++) {
            ids[i] = userNFTIds[_user].at(i);
        }
        return ids;
    }

    /**
     * @notice get user balance in Olympus
     */
    function userBalance(address _user) public view override returns (uint256) {
        return balanceOf(_user) + founderBalance[_user];
    }

    /**
     * @notice get the total amount of Meraki staked in Olympus.
     */
    function totalAmountDeposited() public view override returns (uint256) {
        return totalDeposits;
    }

    function getFounderList() public view returns (address[] memory) {
        return founderList;
    }

    /**
     * @notice Meraki Tokens are non-fungible so the sMRKI representing them have 0 decimals
     */
    function decimals() public pure override returns (uint8) {
        return 0;
    }
}
