// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.15;

// We can import contract directly from github!!
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";

contract UsingLibraryDemo {

    // NOTE:
    // SafeMath is no longer need for solidity >= 0.8.0
    using SafeMath for uint;

    mapping(address => uint) public tokenBalance;


    constructor() {
        tokenBalance[msg.sender] = 1;
    }

    function sendToken(address _to, uint _amount) view public returns(bool) {
        tokenBalance[msg.sender].sub(_amount);
        tokenBalance[_to].add(_amount);

        return true;
    }
}