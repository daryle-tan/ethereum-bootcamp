// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library UIntFunctions {
    function isEven(uint integer) public pure returns (bool) {
        if (integer % 2 == 0) {
            return true;
        }
        return false;
    }
}
