// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v5.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v5.0.0/contracts/access/Ownable.sol";

contract Register {
    function register(address _recipient) public returns (uint256 tokenId) {}
}

contract ModeToken is Ownable, ERC20 {

    address feeReceiver = msg.sender;
    
    constructor() ERC20("MDOGE", "MDOGE") Ownable(msg.sender) {
        _mint(msg.sender, 1000 * 10 ** 18); //Example amount to mint our ERC20
        feeReceiver = msg.sender; //The deployer of the contract will get the NFT to widthraw the earned fees
    }

    /// @dev Registers this contract and assigns the NFT to the owner of this contract
    /// @param sfsContractAddress This address is the address of the SFS contract
    function registerThis(address sfsContractAddress) public onlyOwner returns (uint256 tokenId){
        Register sfsContract = Register(sfsContractAddress);
        return sfsContract.register(Ownable.owner());
    }
}
