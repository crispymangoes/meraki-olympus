// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

struct Airdrop{
    address airdropToken;
    uint amount;
}

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

    //reward tracking
    address[] public rewardTokens;//available tokens to use as rewards
    mapping(address => uint) public rewardCount;//tracks amount of times rewards are added
    mapping(address => mapping(uint => uint)) public cumulativeRewardShare;//store cumulative reward share as rewards are added
    mapping(address => bool) public isRewarder;

    //user information
    mapping(address => mapping(address => uint)) public rewardCountLastClaim;//store users last claimed reward
    mapping(address => mapping(address => uint)) public rewardOwed;//store reward owed to user
    mapping(address => address) public payoutTo;

    bool public paused;

    modifier checkPause{
        require(!paused, "RewardDistributor: Contract is paused");
        _;
    }

    /**
     * @param _name the name of the staked token users get for joining pool
     * @param _symbol the symbol of the staked token users get for joining the pool
     */
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) Ownable(){}

    /****************************external onlyOwner *************************************/
    function addRewardToken(address _token) external onlyOwner{
        (bool exists,) = inRewardTokens(_token);
        require(!exists, "RewardDistributor: _token is already in rewardTokens");
        cumulativeRewardShare[_token][rewardCount[_token]] = 0;
        rewardCount[_token]+=1;

        rewardTokens.push(_token);
    }

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

    function depositReward(address _token, uint _amount) external checkPause{
        require(isRewarder[msg.sender], "RewardDistributor: Caller is not a rewarder");
        (bool exists,) = inRewardTokens(_token);
        require(exists, "RewardDistributor: _token is not in rewardTokens");
        SafeERC20.safeTransferFrom(IERC20(_token), msg.sender, address(this), _amount);
        
        uint count = rewardCount[_token];
        cumulativeRewardShare[_token][count] = cumulativeRewardShare[_token][count-1] + (_amount/totalAmountDeposited());
        rewardCount[_token]+=1;
    }

    function claimRewards(address _user) external virtual checkPause{
        _claimRewards(_user);
    }

    /****************************public view *************************************/
    ///@dev checks to see if _token is in rewardTokens
    function inRewardTokens(address _token) public view returns(bool, uint){
        for(uint i=0; i<rewardTokens.length; i++){
            if(rewardTokens[i] == _token){
                return (true, i);
            }
        }
        return (false, 0);
    }

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

    function pendingRewards(address _user) public view returns(RewardInfo[] memory rewards){
        rewards = new RewardInfo[](rewardTokens.length);
        uint clc;//count last claim
        uint cc;//current count
        for(uint i=0; i<rewardTokens.length; i++){
            clc = rewardCountLastClaim[rewardTokens[i]][_user];
            cc = rewardCount[rewardTokens[i]] - 1;
            if(cc == clc){
                continue; //user already claimed rewards for this token
            }
            rewards[i] = RewardInfo({
                token: rewardTokens[i],
                amount: rewardOwed[rewardTokens[i]][_user] + userBalance(_user) * (cumulativeRewardShare[rewardTokens[i]][cc] - cumulativeRewardShare[rewardTokens[i]][clc])
            });
            //rewards[i] = rewardOwed[rewardTokens[i]][_user] + userBalance(_user) * (cumulativeRewardShare[rewardTokens[i]][cc] - cumulativeRewardShare[rewardTokens[i]][clc]);
        }
    }

    //returns a sum of all reward tokens owed useful for updating UI state
    function rewardStateUpdate(address _user) public view returns(uint totalRewardBalance){
        uint clc;//count last claim
        uint cc;//current count
        for(uint i=0; i<rewardTokens.length; i++){
            clc = rewardCountLastClaim[rewardTokens[i]][_user];
            cc = rewardCount[rewardTokens[i]] - 1;
            if(cc == clc){
                continue; //user already claimed rewards for this token
            }
            totalRewardBalance += rewardOwed[rewardTokens[i]][_user] + userBalance(_user) * (cumulativeRewardShare[rewardTokens[i]][cc] - cumulativeRewardShare[rewardTokens[i]][clc]);
        }
    }

    function rewardLength() public view returns(uint){
        return rewardTokens.length;
    }

    /****************************internal mutative *************************************/
    /**
     * @dev must be called before a users deposit changes, and before a user claims rewards
     */
    function _updateRewards(address _user) internal{
        uint clc;//count last claim
        uint cc;//current count
        for(uint i=0; i<rewardTokens.length; i++){
            clc = rewardCountLastClaim[rewardTokens[i]][_user];
            cc = rewardCount[rewardTokens[i]] - 1;
            if(cc == clc){
                continue; //user already claimed rewards for this token
            }
            rewardOwed[rewardTokens[i]][_user] += userBalance(_user) * (cumulativeRewardShare[rewardTokens[i]][cc] - cumulativeRewardShare[rewardTokens[i]][clc]);
            rewardCountLastClaim[rewardTokens[i]][_user] = cc;
        }
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
        for(uint i=0; i<rewardTokens.length; i++){
            owed = rewardOwed[rewardTokens[i]][_user];
            rewardOwed[rewardTokens[i]][_user] = 0;
            SafeERC20.safeTransfer(IERC20(rewardTokens[i]), to, owed);
        }
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