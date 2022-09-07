// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import "./RewardDistributor.sol";
import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

contract Olympus is RewardDistributor, ERC721Holder {
    using EnumerableSet for EnumerableSet.UintSet;

    uint256 constant BASE_DECIMALS = 10000;
    uint256 constant MAX_SUPPLY = 100000;

    //user variables
    mapping(address => address) public delegateVoteTo;
    mapping(address => EnumerableSet.UintSet) userNFTIds;

    //founder variables
    mapping(address => uint256) public founderBalance;
    uint256 public totalFounderDeposits;
    address[] public founderList;
    uint256 public founderDepositCap;

    //reward tracking
    uint256 public totalDeposits; //total amount of deposits in pool

    ERC721 private immutable MerakiToken;

    constructor(
        ERC721 _merakiToken,
        ERC20 rewardToken,
        address[] memory _founders,
        uint256[] memory _balances
    ) RewardDistributor("Staked Meraki Token", "sMRKI", rewardToken) {
        MerakiToken = _merakiToken;

        require(_founders.length == _balances.length, "Mismatch founder and balance array length");
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

    function adjustFounderInfo(
        address[] memory _founders,
        uint256[] memory _balances,
        bool _lowerCap
    ) external onlyOwner {
        require(_founders.length == _balances.length, "Meraki: Inputs mismatched length");
        //reset all founder balances
        for (uint256 i = 0; i < founderList.length; i++) {
            _updateRewards(founderList[i]);
            founderBalance[founderList[i]] = 0;
        }

        founderList = _founders;
        uint256 total;
        for (uint256 i = 0; i < founderList.length; i++) {
            require(founderList[i] != address(0), "Meraki: address(0) cannnot be a founder");
            founderBalance[founderList[i]] = _balances[i];
            total += _balances[i];
        }
        require(total <= founderDepositCap, "Meraki: _balances sum excedes founderDepositCap");

        if (total < founderDepositCap) {
            require(
                _lowerCap,
                "Meraki: Sum of _balances is lower than existing founderDepositCap, so _lowerCap must be true"
            );
            totalDeposits = totalDeposits - founderDepositCap + total;
            founderDepositCap = total;
        }
    }

    /****************************external mutative *************************************/
    function stake(uint256[] memory _ids) external whenNotPaused nonReentrant {
        require(_ids.length > 0, "Meraki: _ids is empty");
        //update reward info
        _updateRewards(msg.sender);
        for (uint256 i = 0; i < _ids.length; i++) {
            MerakiToken.safeTransferFrom(msg.sender, address(this), _ids[i], "");
            userNFTIds[msg.sender].add(_ids[i]);
            //userNFTIds[msg.sender].push(_ids[i]);
        }
        totalDeposits += _ids.length;
        _mint(msg.sender, _ids.length);
    }

    function unstake(uint256 _amount) external nonReentrant {
        require(_amount > 0, "Meraki: _amount is zero");
        //update reward info
        _updateRewards(msg.sender);
        uint256 initialBal = balanceOf(msg.sender); //was the Length of userNFTIds
        totalDeposits -= _amount;
        _burn(msg.sender, _amount);
        //send user their NFTs
        require(_amount <= initialBal, "_amount excedes balance");
        uint256 idToTransfer;
        for (uint256 i = 1; i <= _amount; i++) {
            idToTransfer = userNFTIds[msg.sender].at(0);
            MerakiToken.safeTransferFrom(address(this), msg.sender, idToTransfer);
            userNFTIds[msg.sender].remove(idToTransfer);
        }
    }

    /****************************public view *************************************/
    //needs to account for founder less voting power
    function DAOVotingPower(address _user) public view returns (uint256) {
        return balanceOf(_user) + ((founderBalance[_user] * (MAX_SUPPLY - founderDepositCap)) / founderDepositCap); //account for founders reduced voting power
    }

    function usersNFTs(address _user) public view returns (uint256[] memory ids) {
        ids = new uint256[](userNFTIds[_user].length());
        for (uint256 i = 0; i < userNFTIds[_user].length(); i++) {
            ids[i] = userNFTIds[_user].at(i);
        }
        return ids;
    }

    function userBalance(address _user) public view override returns (uint256) {
        return balanceOf(_user) + founderBalance[_user];
    }

    function totalAmountDeposited() public view override returns (uint256) {
        return totalDeposits;
    }

    function decimals() public pure override returns (uint8) {
        return 0;
    }
}
