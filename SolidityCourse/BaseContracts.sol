// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Ownable {
    address owner;
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor() {
        owner = msg.sender;
    }
}

contract Transferable is Ownable {
    function transfer(address newOwner) external onlyOwner {
        owner = newOwner;
    }
}
