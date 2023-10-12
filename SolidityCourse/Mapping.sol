// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    mapping(address => bool) public members;

    function addMember(address _member) external {
        members[_member] = true;
    }

    function isMember(address _member) external returns (bool) {
        return members[_member];
    }

    function removeMember(address _member) external {
        members[_member] = false;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    function createUser() external {
        require(!users[msg.sender].isActive);
        users[msg.sender] = User(100, true);
    }

    function transfer(address recipient, uint amount) external {
        require(users[msg.sender].isActive && users[recipient].isActive);
        require(users[msg.sender].balance >= amount);
        users[msg.sender].balance -= amount;
        users[recipient].balance += amount;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum ConnectionTypes {
        Unacquainted,
        Friend,
        Family
    }

    // TODO: create a public nested mapping `connections`
    mapping(address => mapping(address => ConnectionTypes)) public connections;

    function connectWith(address other, ConnectionTypes connectionType)
        external
    {
        // TODO: make the connection from msg.sender => other => connectionType
        connections[msg.sender][other] = connectionType;
    }
}
