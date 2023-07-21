// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    address[] public owners;
    uint public transactionCount;
    uint public required;

    struct Transaction {
        address destination;
        uint value;
        bool executed;
    }

    mapping(uint => Transaction) public transactions;
    mapping(uint => mapping(address => bool)) public confirmations;

    constructor(address[] memory _owners, uint _confirmations) {
        require(_owners.length > 0);
        require(_confirmations > 0);
        require(_confirmations <= _owners.length);
        owners = _owners;
        required = _confirmations;
    }

    function getConfirmationsCount(uint transactionId)
        public
        view
        returns (uint256 numberOfConfirmations)
    {
        for (uint i = 0; i < owners.length; i++) {
            if (confirmations[transactionId][owners[i]]) {
                numberOfConfirmations++;
            }
        }

        return numberOfConfirmations;
    }

    function confirmTransaction(uint transactionId) public {
        confirmations[transactionId][msg.sender] = true;
    }

    function addTransaction(address destination, uint value)
        public
        returns (uint transactionId)
    {
        transactionId = transactionCount;
        transactions[transactionCount] = Transaction(destination, value, false);
        transactionCount += 1;
        return transactionId;
    }
}
