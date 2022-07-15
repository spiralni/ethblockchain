// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

// first contract
contract SendMoneyDemo {

    //uint public balanceReceived;

    // it is only enough to implement a 
    // "payable" function to modify the contract balance
    function receiveMoney() public payable {
        //balanceReceived = msg.value + balanceReceived;
    }

    // returns the balance of this contract
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    // we are sending all the balance to the 
    // "invoker" address
    function withdrawMoney() public {
        // pay attention to the payable modifier
        // msg.sender = address that is calling this contract
        address payable to = payable(msg.sender);

        to.transfer(this.getBalance());
    }

    function withdrawMoneyTo(address payable _to) public {
        _to.transfer(this.getBalance());
    }
}