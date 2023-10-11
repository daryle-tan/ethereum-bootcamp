// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    function filterEven(uint[] calldata num)
        external
        pure
        returns (uint[] memory)
    {
        uint x;

        for (uint i = 0; i < num.length; i++) {
            if (num[i] % 2 == 0) {
                x++;
            }
        }

        uint[] memory onlyEvens = new uint[](x);
        uint y = 0;
        for (uint i = 0; i < num.length; i++) {
            if (num[i] % 2 == 0) {
                onlyEvens[y] = num[i];
                y++;
            }
        }
        return onlyEvens;
    }
}
