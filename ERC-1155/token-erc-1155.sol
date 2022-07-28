// SPDX-License-Identifier: MIT
//version de solidity
pragma solidity ^0.8.7;

import "@openzeppelin/contracts@4.5.0/token/ERC1155/ERC1155.sol";

contract erc1155 is ERC1155 {
     
     //variables
     uint public constant GOLD = 0;
     uint public constant SILVER = 1;
     uint public constant THORS_HAMMER = 2;
     uint public constant SWORD = 3;
     uint public constant SHIELD = 4;

     //constructor del smart contract
     //IPcS nos permite guardar formatos de forma descentralizada 
    constructor() ERC1155("https://game.example/api/item/{id}.json"){
        _mint(msg.sender, GOLD, 10**18, " ");
        _mint(msg.sender, SILVER, 10**27, " ");
        _mint(msg.sender, THORS_HAMMER, 1, " ");
        _mint(msg.sender, SWORD, 10**9, " ");
        _mint(msg.sender, SHIELD, 10**8, " ");
    }

    //URI 
    
}