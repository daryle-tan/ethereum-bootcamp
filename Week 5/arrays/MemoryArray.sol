// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract MemoryArray {
    function filterEven(uint[] calldata _x)
        external
        pure
        returns (uint[] memory)
    {
        uint countEven;
        for (uint i = 0; i < _x.length; i++) {
            if (_x[i] % 2 == 0) {
                countEven++;
            }
        }
        uint[] memory even = new uint[](countEven);
        uint index = 0;
        for (uint i = 0; i < _x.length; i++) {
            if (_x[i] % 2 == 0) {
                even[index] = _x[i];
                index++;
            }
        }
        return even;
    }
}
