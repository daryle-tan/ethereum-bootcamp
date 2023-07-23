// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./IERC20.sol";

contract Chest {
    function plunder(address[] calldata addresses) external {
        for (uint i = 0; i < addresses.length; i++) {
            // get contract address
            IERC20 token = IERC20(addresses[i]);
            // get the balance of this contract's address
            uint256 amount = token.balanceOf(address(this));
            // transfer token balance to caller of function
            token.transfer(msg.sender, amount);
        }
    }
}
