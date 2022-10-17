// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Olympus } from "src/Olympus.sol";
import { OlympusAggregator } from "src/OlympusAggregator.sol";
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
            founders = new address[](1);
            founders[0] = 0xa5E5860B34ac0C55884F2D0E9576d545e1c7Dfd4;
            balances = new uint256[](1);
            balances[0] = 90_000;
        } else if (chainId == MUMBAI) {
            // WETH = new MintableERC20();
            // merakiToken = new MintableERC721();
            // founders = new address[](1);
            // founders[0] = 0xa5E5860B34ac0C55884F2D0E9576d545e1c7Dfd4;
            // balances = new uint256[](1);
            // balances[0] = 90_000;
        }

        // Olympus olympus = new Olympus(merakiToken, WETH, founders, balances, 0.01e18);
        Olympus olympus = Olympus(0x80247ed56D7De4487feb40d7814566774C713792);

        uint256 minimumForUpkeep = 1e18;
        OlympusAggregator aggregator = new OlympusAggregator(olympus, minimumForUpkeep);

        vm.stopBroadcast();
    }
}
