// SPDX-License-Identifier: MIT
//version de solidity
pragma solidity ^0.8.7;

import "./token-erc-20.sol";

contract customERC20 is ERC20 {
    
    constructor() ERC20("joan", "ja"){}

    function createToakens() public {
        _mint(msg.sender, 100);
    }
    
}