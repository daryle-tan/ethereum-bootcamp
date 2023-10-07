// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address public deployer;

    constructor() payable {
        require(msg.value >= 1 ether);
        deployer = msg.sender;
    }

    function withdraw() public {
        if (msg.sender != deployer) {
            revert();
        }
        payable(deployer).transfer(address(this).balance);
    }
}
