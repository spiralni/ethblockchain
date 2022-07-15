// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.14 <0.9.0;

// first contract
contract MappingStructureContract {

    mapping(address => uint) public balanceReceived;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawAllMoney(address payable _to) public {
        uint balanceToSend = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;

        _to.transfer(balanceToSend);
    }

    function withdrawMoney(address payable _to, uint _requestedAmount) public {
        // first check if this address
        // have the amount of money requested
        uint balance = balanceReceived[msg.sender];

        require(_requestedAmount > balance, "requested amount exceeds the amount available");

        // IMPORTANT!!!
        balanceReceived[msg.sender] -= balance;

        _to.transfer(_requestedAmount);
    }
}