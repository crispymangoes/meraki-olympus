// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Olympus } from "src/Olympus.sol";
import { MerakiToken } from "src/MerakiToken.sol";
import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { MintableERC20, ERC20 } from "src/MintableERC20.sol";
import { MintableERC721, ERC721 } from "src/MintableERC721.sol";
import { Chainlist } from "script/Chainlist.sol";
import "@forge-std/Script.sol";

contract OlympusScript is Script, Chainlist {
    ERC721 private merakiToken;
    ERC20 private WETH;
    address[] private founders;
    uint256[] private balances;

    uint256 private chainId = block.chainid;

    function run() public {
        vm.startBroadcast();
        //could use block.chainid to figure out what  network we are deploying to?
        if (chainId == MATIC) {
            WETH = ERC20(0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619);
            merakiToken = ERC721(0xD6faC20553F169290EE8D26144dF68f9e989f84f);
            founders = new address[](7);
            founders[0] = 0xE4B1bb71c2fbF403DA1CEaB92CFaaAA2D188C258;
            founders[1] = 0xeF31c6CC64d2a525f2744Cc13ec9b70ECDdBee2d;
            founders[2] = 0xE471f43De327bF352b5E922FeA92eF6D026B4Af0;
            founders[3] = 0xf0AA3cCca28180a6E60C6ceEe57B0acd1Ba64670;
            founders[4] = 0xFe74D8Aa97e0e482D8A8bE76f8400BD34c080737;
            founders[5] = 0x69321ecB1CF0f0581d4b75EAfaAF1df01f24b77E;
            founders[6] = 0x49819341F719e17bF928aE48b2aE5b1130dB67dA;
            balances = new uint256[](7);
            balances[0] = 17_500;
            balances[1] = 17_500;
            balances[2] = 5_000;
            balances[3] = 5_000;
            balances[4] = 10_000;
            balances[5] = 15_000;
            balances[6] = 19_975;
        } else if (chainId == MUMBAI) {
            WETH = new MintableERC20();
            merakiToken = new MintableERC721();
            founders = new address[](1);
            founders[0] = 0xa5E5860B34ac0C55884F2D0E9576d545e1c7Dfd4;
            balances = new uint256[](1);
            balances[0] = 90_000;
        }

        new Olympus(merakiToken, WETH, founders, balances, 0.01e18);
        vm.stopBroadcast();
    }
}
