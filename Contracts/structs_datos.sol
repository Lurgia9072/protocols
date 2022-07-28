// SPDX-License-Identifier: MIT
//version de solidity
pragma solidity ^0.8.6;

contract data_structures {
    //estructura de datos de un cliente
    struct Customer {
        uint id;
        string name;
        string email;    
    }
  
    //variables de tipo cliente

    Customer customer_1 = Customer(1, "lia", "lia@gmail.com");

    //Array de uint de longitud fija
    uint [5] public fixed_list_uints = [1,2,3,4,5];
    //Array dinamico 
    uint [] dynamic_list_uints;

//la variable de tipo memory va ser que no se guarde los datos en blockchain y torage si guarda directamente en blockchain

    //Array dinamico de tipo Customer
    Customer [] public dynamic_list_customer;

    function array_modificatios(uint _id, string memory _name, string memory _email) public {
       Customer memory random_customer = Customer(_id, _name ,_email);
        dynamic_list_customer.push(random_customer);
    }

    //Mapping es clave valor( calve se asocia a su valor)
    mapping (address => uint) public address_uint;
    mapping (string => uint[]) public string_list;
    mapping (address  => Customer) public address_dataStructure;

    //asignando la clave a su valor 
    function assignNumber (uint _number) public {
        address_uint[msg.sender] = _number;
    }
    function assignList (string memory _name, uint _number) public {
        string_list[_name].push(_number);
    }
    //Asignacion de una estructura de datos a una direccion 
    function assignDataStorage(uint _id, string memory _name, string memory _email) public {
        address_dataStructure[msg.sender] = Customer(_id, _name, _email);
    }
}
// < y >