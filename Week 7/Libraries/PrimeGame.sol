// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./Prime.sol";

contract PrimeGame {
    function isWinner() public view returns (bool) {
        uint num = block.number;
        if (Prime.isPrime(num)) {
            return true;
        }
        return false;
    }
}
