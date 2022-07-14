// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

// first contract
contract Variables {
    // uint = uint256 
    // variables are initialized with default values
    uint256 public myuint;

    bool public mybool;

    // this is a 8 bit integer
    // max value4 2^8 - 1 = 255
    uint8 public myuint8;

    // 20 byte value 
    address public myaddress;

    string public mystring;

    function setMyUint(uint _val) public {
        myuint = _val;
    }

    function setMyBool(bool _val) public {
        mybool = _val;
    }

    function setMyUint8(uint8 _val) public {
        myuint8 = _val;
    }

    function incremenMytUint8() public {
        myuint8++;
    }

    function decrementMytUint8() public {
        myuint8--;
    }

    function setMyAddress(address _val) public {
        myaddress = _val;
    }

    // the view keyword indicates that this function
    // won't modify the internal state of the conctrat
    function getBalanceOfAddress() public view returns(uint) {
        return myaddress.balance;
    }

    // look at the memory keyword!
    // this string will be saved in memory storage
    // BEWARE that: It is very expensive to work with strings
    function setMyString(string memory _val) public {
        mystring = _val;
    }
}