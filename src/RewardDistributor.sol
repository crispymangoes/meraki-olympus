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
 * @notice on every reward deposit the summation of rewardDeposit/totalBalance is saved and used to calculate
 * a users reward share
 * @dev _updateReward must be called before a users userBalance changes, and  before _claimRewards is called
 * @dev Need to implement a deposit function that calls _mint
 * @dev need to implement a withdraw function that calls _burn
 */
abstract contract RewardDistributor is Ownable, ERC20, Pausable, ReentrancyGuard {
    using SafeERC20 for ERC20;
    using Math for uint256;

    //reward tracking
    uint256 public rewardCount = 1; //tracks amount of times rewards are added
    mapping(uint256 => uint256) public cumulativeRewardShare; //store cumulative reward share as rewards are added

    //user information
    mapping(address => uint256) public rewardCountLastClaim; //store users last claimed reward
    mapping(address => uint256) public rewardOwed; //store reward owed to user
    mapping(address => address) public payoutTo;

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
    function Pause() external onlyOwner {
        _pause();
    }

    function unPause() external onlyOwner {
        _unpause();
    }

    /****************************external mutative *************************************/

    function setPayoutTo(address _to) external nonReentrant {
        payoutTo[msg.sender] = _to;
    }

    event RewardsAdded(uint256 amount, uint256 timestamp);

    function depositReward(uint256 _amount) external whenNotPaused nonReentrant {
        rewardToken.safeTransferFrom(msg.sender, address(this), _amount);

        uint256 count = rewardCount;
        cumulativeRewardShare[count] = cumulativeRewardShare[count - 1] + _amount.mulDiv(1e18, totalAmountDeposited());

        rewardCount++;
        emit RewardsAdded(_amount, block.timestamp);
    }

    function claimRewards(address _user) external virtual whenNotPaused nonReentrant returns (uint256) {
        return _claimRewards(_user);
    }

    /****************************public view *************************************/

    /**
     * @dev should return a users balance
     */
    function userBalance(address _user) public view virtual returns (uint256) {
        return balanceOf(_user);
    }

    /**
     * @dev should return the total amount of deposit in the contract
     */
    function totalAmountDeposited() public view virtual returns (uint256) {
        return totalSupply();
    }

    function pendingRewards(address _user) public view returns (uint256 reward) {
        uint256 clc = rewardCountLastClaim[_user]; //count last claim
        uint256 cc = rewardCount - 1; //current count

        reward = rewardOwed[_user];
        if (cc > clc) {
            reward += userBalance(_user).mulDiv((cumulativeRewardShare[cc] - cumulativeRewardShare[clc]), 1e18);
        }
    }

    /****************************internal mutative *************************************/
    /**
     * @dev must be called before a users deposit changes, and before a user claims rewards
     */
    function _updateRewards(address _user) internal {
        if (rewardCount == 0) return; // nothing to do.
        uint256 clc = rewardCountLastClaim[_user]; //count last claim
        uint256 cc = rewardCount - 1; //current count
        if (cc == clc) {
            return; //user already claimed rewards for this token
        }
        rewardOwed[_user] += userBalance(_user).mulDiv((cumulativeRewardShare[cc] - cumulativeRewardShare[clc]), 1e18);
        rewardCountLastClaim[_user] = cc;
    }

    error RewardDistributor__NothingOwed();

    error RewardDistributor__ZeroAddress();

    function _claimRewards(address _user) internal returns (uint256) {
        if (_user == address(0)) revert RewardDistributor__ZeroAddress();
        _updateRewards(_user);
        address to = payoutTo[_user] != address(0) ? payoutTo[_user] : _user;

        uint256 owed = rewardOwed[_user];
        if (owed > 0) {
            rewardOwed[_user] = 0;
            rewardToken.safeTransfer(to, owed);
            return owed;
        } else {
            revert RewardDistributor__NothingOwed();
        }
    }

    error RewardDistributor__TransfersNotAllowed();

    //Do not allow any token transfers
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual override {
        super._beforeTokenTransfer(from, to, amount);
        if (from != address(0) && to != address(0)) revert RewardDistributor__TransfersNotAllowed();
    }
}
