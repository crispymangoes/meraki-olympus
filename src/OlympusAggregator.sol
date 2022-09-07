// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import { SafeERC20 } from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { Olympus } from "src/Olympus.sol";

//TODO set up keepers.
contract OlympusAggregator is Ownable {
    using SafeERC20 for ERC20;

    Olympus public immutable olympus;

    constructor(Olympus _olympus) {
        olympus = _olympus;
    }

    function withdrawToken(ERC20 token, uint256 _amount) external onlyOwner {
        uint256 amount = _amount == 0 ? token.balanceOf(address(this)) : _amount;
        token.safeTransfer(owner(), amount);
    }

    function sendRewardToOlympus(uint256 _amount) external {
        _sendRewardToOlympus(_amount);
    }

    function _sendRewardToOlympus(uint256 _amount) internal {
        olympus.rewardToken().safeApprove(address(olympus), _amount);
        olympus.depositReward(_token, _amount);
    }
}
