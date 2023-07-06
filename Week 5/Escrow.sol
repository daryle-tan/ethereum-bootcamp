// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Escrow {
    // depositor is signer
    address public depositor;
    // beneficiary
    address public beneficiary;
    // arbiter
    address public arbiter;
    bool public isApproved;

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        depositor = msg.sender;
        isApproved = false;
    }

    event Approved(uint);

    function approve() external {
        uint balance = address(this).balance;
        require(msg.sender == arbiter);
        (bool sent, ) = beneficiary.call{value: balance}("");
        require(sent, "Failed to send funds!");
        isApproved = true;

        emit Approved(balance);
    }
}
