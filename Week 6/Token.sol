// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Token {
    string public name = "Bad Kitty";
    string public symbol = "BKT";
    uint8 public decimals = 18;

    uint256 public totalSupply;

    mapping(address => uint256) public balances;

    event Transfer(address, address, uint256);

    constructor() {
        totalSupply = 1000 * (10**decimals);
        balances[msg.sender] = totalSupply;
    }

    function transfer(address recipient, uint256 amount) public returns (bool) {
        require(balances[msg.sender] >= amount);
        balances[msg.sender] -= amount;
        balances[recipient] += amount;

        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function balanceOf(address _address) external view returns (uint) {
        return balances[_address];
    }
}
