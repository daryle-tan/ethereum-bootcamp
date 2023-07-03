// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Member {
    // in mapping, the key has to be a value data type but the value can be any type such as the reference data type
    mapping(address => bool) public members;

    function addMember(address _memb) external {
        members[memb] = true;
    }

    function isMember(address _memb) external view returns (bool) {
        return members[memb];
    }

    function removeMember(address _memb) external {
        members[memb] = false;
    }
}
