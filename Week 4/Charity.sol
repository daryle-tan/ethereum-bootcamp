// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Charity {
    address public owner;
    address public charity;

    constructor(address _charity) payable {
        owner = msg.sender;
        charity = _charity;
    }

    function tip() public payable {
        (bool s,) = owner.call{value: msg.value}("");
        require(s);
    }

    function donate() public payable {
        (bool s, ) = charity.call{value: address(this).balance}("");
        require(s);
    
        selfdestruct(payable(charity));
    }

    

    receive() external payable {

    }

    fallback() external {
        
    }
}

/** 
msg.data (bytes) - the complete calldata
msg.sender (address) - the address sending the message
msg.sig (bytes4) - the targeted function signature
msg.value (uint) - the amount of wei sent
*/