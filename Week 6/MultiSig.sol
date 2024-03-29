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
        bytes data;
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

    function executeTransaction(uint transactionId) public payable {
        require(isConfirmed(transactionId), "Transaction not confirmed");
        Transaction storage _tx = transactions[transactionId];
        (bool s, ) = _tx.destination.call{value: _tx.value}(_tx.data);
        require(s);
        _tx.executed = true;
    }

    function isConfirmed(uint transactionId) public view returns (bool) {
        if (getConfirmationsCount(transactionId) >= required) {
            return true;
        }
        return false;
    }

    function submitTransaction(
        address destination,
        uint value,
        bytes calldata data
    ) external {
        // add transaction and add to storage
        uint id = addTransaction(destination, value, data);
        // confirm it
        confirmTransaction(id);
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

    function isOwner(address owner) public view returns (bool) {
        for (uint i = 0; i < owners.length; i++) {
            if (msg.sender == owners[i]) {
                return true;
            }
        }
        return false;
    }

    function confirmTransaction(uint transactionId) public {
        require(isOwner(msg.sender), "Must be an owner!");
        confirmations[transactionId][msg.sender] = true;
        if (isConfirmed(transactionId)) {
            executeTransaction(transactionId);
        }
    }

    function addTransaction(
        address destination,
        uint value,
        bytes calldata data
    ) internal returns (uint transactionId) {
        transactionId = transactionCount;
        transactions[transactionCount] = Transaction(
            destination,
            value,
            false,
            data
        );
        transactionCount += 1;
        return transactionId;
    }

    receive() external payable {}
}
