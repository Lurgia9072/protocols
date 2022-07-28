// SPDX-License-Identifier: MIT
//version de solidity
pragma solidity ^0.8.7;

contract Variables_modifiers {
    //valores enteros sin signos (unit)
    uint8 a; //por defecto privada solo se visualiza en el contrato
    uint8 public b = 4;

    //valores enteros con signo
    int256 c;
    int8 d = -1;
    int e = 52;

    //string 
    string public str = "esto es publico";
    string private str1 = "esto es privado";

    //booleans
    bool public _true = true;
    bool private _false = false;

    //bytes
    bytes  first_byte;

    //algoritmo de hash
    bytes32 public hashing_keccak256 = keccak256(abi.encodePacked("hello", "lia", uint(1), 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4));
    bytes32 public hashing_sha256 = sha256(abi.encodePacked("hello", "lia"));
    bytes20 public hashing_ripemd160 = ripemd160(abi.encodePacked("hello", "lia"));

    //variables addres
    address my_address;
    address public  address_1 = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address public address_2 = msg.sender;

    //variables de enumeracion
    enum options {ON, OFF}
    options state;
    options constant defaultChoice = options.OFF;

    function trueOn() public {
        state = options.ON;
    }

    function trueOFF() public {
        state = options.OFF;
    }

    function displayState() public view returns (options){
        return state;
    }

}