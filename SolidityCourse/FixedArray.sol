// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    function sum(uint[5] calldata num) external pure returns (uint total) {
        for (uint i = 0; i < num.length; i++) {
            total += num[i];
        }
        return total;
    }
}
