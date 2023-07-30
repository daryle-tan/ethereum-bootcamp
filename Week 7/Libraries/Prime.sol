// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library Prime {
    function dividesEvenly(uint num1, uint num2) public pure returns (bool) {
        if (num1 % num2 == 0) {
            return true;
        }
        return false;
    }

    function isPrime(uint num) public pure returns (bool) {
        for (uint i = 2; i <= num / 2; i++) {
            if (dividesEvenly(num, i)) {
                return false;
            }
        }
        return true;
    }
}
