// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Sum {
    function sum(uint[5] calldata _arr) external pure returns (uint _sum) {
        for (uint i = 0; i < _arr.length; i++) {
            _sum += _arr[i];
        }
    }
}
