// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StackClub {
    address[] members;

    constructor() {
        members.push(msg.sender);
    }

    function isMember(address person) public view returns (bool member) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == person) {
                return true;
            }
        }
        return false;
    }

    function removeLastMember() external {
        require(isMember(msg.sender));
        members.pop();
    }

    function addMember(address newMember) external {
        require(isMember(msg.sender));
        members.push(newMember);
    }
}
