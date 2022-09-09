// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
import { SafeERC20 } from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { Olympus } from "src/Olympus.sol";
import { KeeperCompatibleInterface } from "@chainlink/contracts/src/v0.8/interfaces/KeeperCompatibleInterface.sol";

contract OlympusAggregator is Ownable, KeeperCompatibleInterface {
    using SafeERC20 for ERC20;

    Olympus public immutable olympus;

    uint256 public upkeepMinimum; // Minimum required rewardToken to trigger an upkeep.

    constructor(Olympus _olympus, uint256 _minimum) {
        olympus = _olympus;
        upkeepMinimum = _minimum;
    }

    function withdrawToken(ERC20 token, uint256 _amount) external onlyOwner {
        uint256 amount = _amount == 0 ? token.balanceOf(address(this)) : _amount;
        token.safeTransfer(owner(), amount);
    }

    function sendRewardToOlympus() external {
        uint256 amount = olympus.rewardToken().balanceOf(address(this));
        _sendRewardToOlympus(amount);
    }

    function checkUpkeep(bytes calldata) external view returns (bool upkeepNeeded, bytes memory performData) {
        return (olympus.rewardToken().balanceOf(address(this)) >= upkeepMinimum, abi.encode(0));
    }

    error OlympusAggregator__MinimumNotMet(uint256 minimum, uint256 currentBalance);

    /**
     * @notice performData is not used, so this function can be safely left with no caller checks.
     */
    function performUpkeep(bytes calldata) external {
        uint256 amount = olympus.rewardToken().balanceOf(address(this));
        if (amount < upkeepMinimum) revert OlympusAggregator__MinimumNotMet(upkeepMinimum, amount);

        _sendRewardToOlympus(amount);
    }

    function _sendRewardToOlympus(uint256 _amount) internal {
        olympus.rewardToken().safeApprove(address(olympus), _amount);
        olympus.depositReward(_amount);
    }
}
