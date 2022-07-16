// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.14 <0.9.0;

// first contract
contract SimpleMappingContract {
    // mapping is a key-value type
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;

    function setMappingValue(uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAddressMappingValue() public {
        // msg.sender = the one that is invoking this method
        address senderAddress = msg.sender;
        myAddressMapping[senderAddress] = true;
    }
}