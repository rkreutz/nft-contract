// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

// We inherit the contract we imported. This means we'll have access
// to the inherited contract's methods.
contract CryptoMemes is ERC721URIStorage, Ownable {
  // Magic given to us by OpenZeppelin to help us keep track of tokenIds.
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  // We need to pass the name of our NFTs token and it's symbol.
  constructor() ERC721 ("CryptoMemes", "CMEME") Ownable() {}
  
  function mint(string memory _tokenURI) public onlyOwner {
    uint256 newItemId = _tokenIds.current();
    _safeMint(msg.sender, newItemId);
    _setTokenURI(newItemId, _tokenURI);
    _tokenIds.increment();
  }
}