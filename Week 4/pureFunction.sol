// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Contract {
    function double(uint256 x) external pure returns(uint256) {
        return x * 2;
    }
    // could change the visibility to public so it can be called internally as well
    function double(uint256 x, uint256 y) external pure returns(uint256, uint256) {
        return (x * 2, y * 2);
    }
}