// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MintableERC20 is ERC20 {
    constructor() ERC20("Mintable ERC20", "MERC20") {}

    function mint(address to) public {
        _mint(to, 1e30);
    }
}
