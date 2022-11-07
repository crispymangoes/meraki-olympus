// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import { Olympus, ERC721, ERC20 } from "src/Olympus.sol";
import { SafeERC20 } from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract MockOlympus is Olympus {
    using SafeERC20 for ERC20;

    constructor(
        ERC721 _merakiToken,
        ERC20 _rewardToken,
        address[] memory _founders,
        uint256[] memory _balances,
        uint256 _minRewardDeposit
    ) Olympus(_merakiToken, _rewardToken, _founders, _balances) {}

    function depositReward(uint256 _amount) public whenNotPaused nonReentrant {
        rewardToken.safeTransferFrom(msg.sender, address(this), _amount);

        _depositReward(_amount);
    }
}
