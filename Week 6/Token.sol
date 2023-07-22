// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Token {
    string public name = "Bad Kitty";
    string public symbol = "BKT";
    uint8 public decimals = 18;

    uint256 public totalSupply;

    mapping(address => uint256) public balances;

    function balanceOf(address _address) external view returns (uint) {
        return balances[_address];
    }
}
