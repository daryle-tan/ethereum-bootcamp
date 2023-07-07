// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract StackClub {
    address[] members;

    constructor() {
        members.push(msg.sender);
    }

    function addMember(address _newMember) external {
        require(isMember(msg.sender), "Must be a member!");
        members.push(_newMember);
    }

    function removeLastMember() external {
        require(isMember(msg.sender), "Must be a member!");
        members.pop();
    }

    function isMember(address _member) public view returns (bool _isMember) {
        for (uint i = 0; i < members.length; i++) {
            if (_member == members[i]) {
                _isMember = true;
            }
        }

        return _isMember;
    }
}
