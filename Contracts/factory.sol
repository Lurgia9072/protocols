// SPDX-License-Identifier: MIT
//version de solidity
pragma solidity ^0.8.7;

contract padre {
    //almacenamiento de la informacion del factory
    mapping (address => address) public personal_contract;
    //emision de los nuevos contratos
    function Factory() public {
        address addr_personal_contract = address(new hijo(msg.sender, address(this)));
        personal_contract[msg.sender] = addr_personal_contract;

    }

}

contract hijo {
    //structor de datos del propietario
    Owner public propietario;
    struct Owner {
        address _owner;
        address _smartcontract;
    }
    //datos recibido al nuevo smart contracts
    constructor(address _account, address _account2){
        propietario._owner = _account;
        propietario._smartcontract = _account2;
    }

}