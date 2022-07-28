// SPDX-License-Identifier: MIT
//version de solidity
pragma solidity ^0.8.6;

contract ethSend {
    constructor () payable {}
    receive () external payable {}

    event sendStatus(bool);
    event callStatus(bool, bytes);

    function sendViaTransfer(address payable _to) public payable {
       _to.transfer(1 ether);
    }
    function sendViaSend(address payable _to) public payable {
         bool sent = _to.send(1 ether);
        emit sendStatus(sent);
        require(sent == true, "ha fallado");
    }
    function sendCall(address payable _to) public payable {
        (bool success, bytes memory data) = _to.call{value: 1 ether}("");
        emit callStatus(success, data);
        require(success == true, "ha fallado");
    }
}

contract ethReciver {
    event log(uint amount, uint gas);
    receive() external payable {
        emit log(address(this).balance, gasleft());
    }
}