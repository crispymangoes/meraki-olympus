// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Meraki Token used for profit sharing
 * @author crispymangoes
 */
contract MerakiToken is ERC721, Ownable {
    bool public mintingStopped = false; /// @notice bool used to permanately stop minting
    string public uri;

    /**
     * @notice emitted when the uri is changed
     */
    event UriChanged(string newURI);

    constructor() ERC721("Meraki Token", "MERAKI") {}

    /****************** External Priviledged Functions ******************/
    /**
     * @notice used to mint 100,000 token supply
     * @notice initially first 10,000 will be minted for IDO, then a timelock will become owner of this contract
     */
    function adminBatchMint(
        address _to,
        uint256 _startingIndex,
        uint256 _amount
    ) external onlyOwner {
        require(!mintingStopped, "Minting has been turned off");
        uint256 index = _startingIndex;
        for (uint256 i = 0; i < _amount; i++) {
            _safeMint(_to, index);
            index += 1;
        }
    }

    /**
     * @notice permanately stops minting when called
     */
    function stopMinting() external onlyOwner {
        mintingStopped = true;
    }

    /**
     * @notice allows owner to change token meta data
     */
    function setURI(string memory _uri) external onlyOwner {
        uri = _uri;
        emit UriChanged(_uri);
    }

    /****************** External State Reading Functions ******************/
    /**
     * @notice all tokens share the same meta data so tokenId is not used
     */
    function tokenURI(uint256) public view override returns (string memory) {
        return uri;
    }

    /****************** Internal State Reading Functions ******************/
    /**
     * @notice implements the _baseURI method in the ERC721 standard
     * @notice used by tokenURI to create a tokens URI
     */
    function _baseURI() internal view override returns (string memory) {
        return uri;
    }
}
