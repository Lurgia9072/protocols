// SPDX-License-Identifier: MIT
//version de solidity
pragma solidity ^0.8.6;

contract functiones {

    //funciones pure no se visualizata tampoco se modifica no se guarda en la blockchain 
    function getName() public pure returns (string memory) {
        return "lia";
    }
    //funcion view se visualiza pero  no modifica pero retorna datos de la blockchain
    uint x = 100;
    function getNumber() public view returns (uint){
        return x*2;
    }

}