// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

struct RewardInfo{
    address token;
    uint amount;
}

/**
 * @title Adds advanced reward distribution logic to a staking contract
 * @author crispymangoes
 * @notice on every reward deposit the summation of rewardDeposit/totalBalance is saved and used to calculate
 * a users reward share
 * @notice Airdrops are handled using an ERC20 snapshot
 * @dev _updateReward must be called before a users userBalance changes, and  before _claimRewards is called 
 * @dev Need to implement a deposit function that calls _mint
 * @dev need to implement a withdraw function that calls _burn
 */
abstract contract RewardDistributor is Ownable, ERC20{
    using SafeERC20 for ERC20;

    //reward tracking
    mapping(address => uint) public rewardCount;//tracks amount of times rewards are added
    mapping(address => mapping(uint => uint)) public cumulativeRewardShare;//store cumulative reward share as rewards are added
    mapping(address => bool) public isRewarder;

    //user information
    mapping(address => mapping(address => uint)) public rewardCountLastClaim;//store users last claimed reward
    mapping(address => mapping(address => uint)) public rewardOwed;//store reward owed to user
    mapping(address => address) public payoutTo;

    bool public paused;

    ERC20 private immutable rewardToken;

    modifier checkPause{
        require(!paused, "RewardDistributor: Contract is paused");
        _;
    }

    /**
     * @param _name the name of the staked token users get for joining pool
     * @param _symbol the symbol of the staked token users get for joining the pool
     */
    constructor(string memory _name, string memory _symbol, ERC20 _rewardToken) ERC20(_name, _symbol) Ownable(){
        rewardToken = _rewardToken;
    }

    /****************************external onlyOwner *************************************/
    function adjustRewarder(address _rewarder, bool _state) external onlyOwner{
        isRewarder[_rewarder] = _state;
    }

    function Pause() external onlyOwner{
        paused = true;
    }

    function unPause() external onlyOwner{
        paused = false;
    }

    /****************************external mutative *************************************/

    function setPayoutTo(address _to) external{
        payoutTo[msg.sender] = _to;
    }

    function depositReward(uint _amount) external checkPause{
        require(isRewarder[msg.sender], "RewardDistributor: Caller is not a rewarder");
        rewardToken.safeTransferFrom(msg.sender, address(this), _amount);
        
        uint count = rewardCount[address(rewardToken)];
        cumulativeRewardShare[address(rewardToken)][count] = cumulativeRewardShare[address(rewardToken)][count-1] + (_amount/totalAmountDeposited());
        rewardCount[address(rewardToken)]+=1;
    }

    function claimRewards(address _user) external virtual checkPause{
        _claimRewards(_user);
    }

    /****************************public view *************************************/

    /**
     * @dev should return a users balance
     */
    function userBalance(address _user) public view virtual returns(uint){
        return balanceOf(_user);
    }

    /**
     * @dev should return the total amount of deposit in the contract
     */
    function totalAmountDeposited() public view virtual returns(uint){
        return totalSupply();
    }

    function pendingRewards(address _user) public view returns(uint256 reward){
        uint clc;//count last claim
        uint cc;//current count
        clc = rewardCountLastClaim[address(rewardToken)][_user];
        cc = rewardCount[address(rewardToken)] - 1;
        if(cc == clc){
            return 0; //user already claimed rewards for this token
        }
        reward = rewardOwed[address(rewardToken)][_user] + userBalance(_user) * (cumulativeRewardShare[address(rewardToken)][cc] - cumulativeRewardShare[address(rewardToken)][clc]); 
    }

    /****************************internal mutative *************************************/
    /**
     * @dev must be called before a users deposit changes, and before a user claims rewards
     */
    function _updateRewards(address _user) internal{
        uint clc;//count last claim
        uint cc;//current count
        clc = rewardCountLastClaim[address(rewardToken)][_user];
        cc = rewardCount[address(rewardToken)] - 1;
        if(cc == clc){
            return; //user already claimed rewards for this token
        }
        rewardOwed[address(rewardToken)][_user] += userBalance(_user) * (cumulativeRewardShare[address(rewardToken)][cc] - cumulativeRewardShare[address(rewardToken)][clc]);
        rewardCountLastClaim[address(rewardToken)][_user] = cc;
    }

    //could allow a user to only claim on certain tokens?  If they pass in a token array
    function _claimRewards(address _user) internal{
        require(_user != address(0), "RewardDistributor: Invalid Address");
        _updateRewards(_user);
        address to = _user;
        if(payoutTo[_user] != address(0)){
            to = payoutTo[_user];
        }
        uint owed;
        owed = rewardOwed[address(rewardToken)][_user];
        rewardOwed[address(rewardToken)][_user] = 0;
        rewardToken.safeTransfer(to, owed);
    }

    //Do not allow any token transfers
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual override {
        super._beforeTokenTransfer(from, to, amount);
        require(from == address(0) || to == address(0), "Reward Distributor: Token transfers are not allowed");
    }
}