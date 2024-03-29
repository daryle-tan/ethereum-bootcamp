// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Escrow {
    address public depositor = msg.sender;
    address public beneficiary;
    address public arbiter;

    event Approved(uint);

    error Escrow__NotTheArbiter(address);

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }

    function approve() external {
        if (msg.sender != arbiter) {
            revert Escrow__NotTheArbiter(msg.sender);
        }

        uint256 balance = address(this).balance;

        (bool s, ) = beneficiary.call{value: address(this).balance}("");
        require(s);

        emit Approved(balance);
    }
}
