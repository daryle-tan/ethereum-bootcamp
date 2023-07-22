// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Ownable {
    address owner = msg.sender;

    modifier onlyOwner() {
        require(msg.sender == owner, "Must be the owner of the contract!");
        _;
    }
}

contract Transferable is Ownable {
    // address newOwner;

    function transfer(address newOwner) external virtual onlyOwner {
        owner = newOwner;
    }
}
