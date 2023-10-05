// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    uint public x;

    constructor(uint _x) {
        x = _x;
    }

    function increment() external {
        x += 1;
    }

    function add(uint num) external view returns (uint) {
        return num += x;
    }

    function winningNumber(string calldata secretMessage)
        external
        returns (uint)
    {
        console.log(secretMessage);
        return 794;
    }

    function double(uint uno) public pure returns (uint doubled) {
        doubled = uno * 2;
    }

    function double(uint uno, uint dos) external pure returns (uint u, uint d) {
        u = double(uno);
        d = double(dos);
        return (u, d);
    }
}
