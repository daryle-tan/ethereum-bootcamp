// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract FilterEven {
    uint[] public evenNumbers;

    function filterEven(uint[] calldata x) external {
        for (uint i = 0; i < x.length; i++) {
            if (x[i] % 2 == 0) {
                evenNumbers.push(x[i]);
            }
        }
    }
}
