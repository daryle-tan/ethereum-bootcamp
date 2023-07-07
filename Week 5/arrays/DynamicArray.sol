// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract DynamicArray {
    function sum(uint[] calldata x) external pure returns (uint _sum) {
        for (uint i = 0; i < x.length; i++) {
            _sum += x[i];
        }
    }
}
