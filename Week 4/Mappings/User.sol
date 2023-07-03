// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract User {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    function createUser() external {
        if (users[msg.sender].isActive) {
            revert();
        }

        users[msg.sender] = User(100, true);
    }

    function transfer(address recipient, uint amount) external {
        require(users[msg.sender].isActive, "Sender is not active");
        require(
            users[msg.sender].balance >= amount,
            "Not enough funds to send"
        );
        require(users[recipient].isActive, "receipient is not active");

        users[msg.sender].balance -= amount;
        users[recipient].balance += amount;
    }
}
