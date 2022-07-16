// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.14 <0.9.0;

// first contract
contract MappingStructureContract {

    // this struct will store
    // the payment information
    struct Payment {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        // total amount of money received
        uint totalBalance;
        // number of payments received from the same address
        uint numberOfPaymentsReceived;
        // list of payments
        mapping (uint => Payment) payments;
    }

    mapping(address => Balance) public balanceReceived;

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function sendMoney() public payable {
        uint currentNumOfPaymentsReceived = balanceReceived[msg.sender].numberOfPaymentsReceived;

        balanceReceived[msg.sender].totalBalance += msg.value;

        Payment memory payment = Payment(msg.value, block.timestamp);
        balanceReceived[msg.sender].payments[currentNumOfPaymentsReceived] = payment;
        balanceReceived[msg.sender].numberOfPaymentsReceived = currentNumOfPaymentsReceived + 1;

    }

    function withdrawAllMoney(address payable _to) public {
        uint balanceToSend = balanceReceived[msg.sender].totalBalance;
        balanceReceived[msg.sender].totalBalance = 0;

        _to.transfer(balanceToSend);
    }

    function withdrawMoney(address payable _to, uint _requestedAmount) public {
        // first check if this address
        // have the amount of money requested
        uint balance = balanceReceived[msg.sender].totalBalance;

        require(balance >= _requestedAmount, "requested amount exceeds the amount available");

        // IMPORTANT!!!
        balanceReceived[msg.sender].totalBalance -= _requestedAmount;

        _to.transfer(_requestedAmount);
    }
}