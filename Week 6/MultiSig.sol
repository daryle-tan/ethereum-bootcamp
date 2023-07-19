// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MultiSig {
    address[] public owners;
    uint256 public required;

    constructor(address[] memory _owner, uint256 _required) {
        require(_owner.length > 0, "Need owner addresses");
        require(_required > 0, "Need more confirmations");
        require(_required <= _owner.length, "Too many confirmations");
        owners = _owner;
        required = _required;
    }
}
