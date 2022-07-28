// SPDX-License-Identifier: MIT
//version de solidity
pragma solidity ^0.8.6;

//importando smart contract desde OpenZeppelin
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

//decalaracion de smart contract 
contract FirstContract is ERC721 {
    //direccion de la persona que despliega el contrato
    address public owner;
    //direccion del propietario

constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {
     //funcion interna lo que hace es darme la direccion de owner(propietario)
     owner = msg.sender;
    }
}