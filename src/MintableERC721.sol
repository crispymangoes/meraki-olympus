// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MintableERC721 is ERC721 {
    uint256 public supply;

    constructor() ERC721("Mintable ERC721", "MERC721") {}

    function mint(address to) public {
        for (uint256 i = supply; i < (supply + 100); i++) {
            _mint(to, i);
        }
    }
}
