// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

// first contract
contract StartStopUpdateContract {
    address owner;

    bool paused;

    // the owner of this contract
    // is the account address used to create the
    // contract itself
    constructor() {
        owner = msg.sender;
    }
    
    // this function allows this contract to 
    // receive money
    function sendMoneyToContract() public payable {
        
    }

    function withdrawAllMoneyFromContract(address payable _to) public {
        // this ensures that only the account that
        // created this contract can withdraw money
        require(msg.sender == owner, "You are not the owner");

        // this will fail if you try to withdraw money 
        // from a paused contract
        require(!paused, "This contract is paused");

        uint contractBalance = address(this).balance;
        _to.transfer(contractBalance);
    }

    function setPaused(bool _isPaused) public {
        require(msg.sender == owner, "You are not the owner");
        paused = _isPaused;
    }

    function destroyContract(address payable _to) public {
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(_to);
    }
}