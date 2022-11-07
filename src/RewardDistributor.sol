// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { SafeERC20 } from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { Math } from "@openzeppelin/contracts/utils/math/Math.sol";
import { Pausable } from "@openzeppelin/contracts/security/Pausable.sol";
import { ReentrancyGuard } from "@openzeppelin/contracts/security/ReentrancyGuard.sol";

/**
 * @title Adds advanced reward distribution logic to a staking contract
 * @author crispymangoes
 * @notice on every user action the summation of rewardDeposit/totalBalance is saved and used to calculate
 * a users reward share
 * @dev _updateReward must be called before a users userBalance changes, and  before _claimRewards is called
 * @dev Need to implement a deposit function that calls _mint
 * @dev need to implement a withdraw function that calls _burn
 * @dev This contract is susceptible to sandwich attacks, where bots front run reward deposit TXs and join
 * right before reward deposits, then leave immediately after. For Olympus integration this attack vector
 * is mitigated because attackers need to purchase/sell illiquid NFTs to join/exit, and the NFTs have a sale royalty.
 * Making it very difficult and expensive to profit off this attack vector.
 */
abstract contract RewardDistributor is Ownable, ERC20, Pausable, ReentrancyGuard {
    using SafeERC20 for ERC20;
    using Math for uint256;

    //reward tracking
    uint256 public totalDeposits; //total amount of deposits in pool
    uint256 public totalRewards; //total amount of rewards in pool
    uint256 public cumulativeRewardShare; //store cumulative reward share as rewards are added

    //user information
    mapping(address => uint256) public lastCumulativeRewardShare; //store users last cumulativeRewardShare
    mapping(address => uint256) public rewardOwed; //store reward owed to user

    ERC20 public immutable rewardToken;

    /**
     * @param _name the name of the staked token users get for joining pool
     * @param _symbol the symbol of the staked token users get for joining the pool
     */
    constructor(
        string memory _name,
        string memory _symbol,
        ERC20 _rewardToken
    ) ERC20(_name, _symbol) Ownable() {
        rewardToken = _rewardToken;
    }

    /****************************external onlyOwner *************************************/
    function pause() external onlyOwner {
        _pause();
    }

    function unPause() external onlyOwner {
        _unpause();
    }

    /****************************external mutative *************************************/
    /**
     * @notice allows users to claim pending `rewardToken`
     */
    function claimRewards(address _user) external virtual whenNotPaused nonReentrant returns (uint256) {
        return _claimRewards(_user);
    }

    /****************************public view *************************************/

    /**
     * @dev should return a users balance
     */
    function userBalance(address _user) public view virtual returns (uint256);

    /**
     * @notice Get the pending rewards for a user.
     * @dev Does not account for unaccount rewards sitting in the contract,
     *      so when users actually claim, they can receive MORE rewards than this view function says.
     */
    function pendingRewards(address _user) public view returns (uint256 reward) {
        // Account for existing reward balance.
        reward = rewardOwed[_user];
        // Account for pending rewards.
        reward += userBalance(_user).mulDiv((cumulativeRewardShare - lastCumulativeRewardShare[_user]), 1e18);
    }

    /****************************internal mutative *************************************/
    /**
     * @dev must be called before a users deposit changes, and before a user claims rewards
     */
    function _updateRewards(address _user) internal {
        // Deposit any rewards transferred to this contract that were not added
        // via depositReward (eg. sale fees, airdrops, stray transfers, etc)
        uint256 undepositedRewards = rewardToken.balanceOf(address(this)) - totalRewards;
        if (undepositedRewards > 0) _depositReward(undepositedRewards);

        rewardOwed[_user] = pendingRewards(_user);
        lastCumulativeRewardShare[_user] = cumulativeRewardShare;
    }

    /**
     * @notice Emitted when rewards are accounted for.
     * @param amount the amount of rewards added.
     * @param timestamp the rewards were added.
     */
    event RewardsAdded(uint256 amount, uint256 timestamp);

    /**
     * @notice Attempted to claim rewards when nothing was owed.
     */
    error RewardDistributor__NothingOwed();

    /**
     * @notice Attempted to claim rewards for zero address.
     */
    error RewardDistributor__ZeroAddress();

    /**
     * @notice Deposits unaccounted reward token balance, incrementing totalRewards, and the cumulative reward.
     */
    function _depositReward(uint256 _amount) internal {
        totalRewards += _amount;
        cumulativeRewardShare += _amount.mulDiv(1e18, totalDeposits);

        emit RewardsAdded(_amount, block.timestamp);
    }

    /**
     * @notice Claims a users rewards and sends it to their address.
     */
    function _claimRewards(address _user) internal returns (uint256 owed) {
        if (_user == address(0)) revert RewardDistributor__ZeroAddress();
        _updateRewards(_user);

        owed = rewardOwed[_user];
        if (owed == 0) revert RewardDistributor__NothingOwed();
        totalRewards -= owed;
        rewardOwed[_user] = 0;
        rewardToken.safeTransfer(_user, owed);
    }

    /**
     * @notice Attempted to transfer ERC20 receipt tokens.
     */
    error RewardDistributor__TransfersNotAllowed();

    /**
     * @dev Token transfers are not allowed because reward logic does NOT account for transfers
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256
    ) internal virtual override {
        if (from != address(0) && to != address(0)) revert RewardDistributor__TransfersNotAllowed();
    }
}
