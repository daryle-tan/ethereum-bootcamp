// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Faucet {

    function withdraw(uint _amount) public {

        require(_amount <= 100000000000000000);
        payable(msg.sender).transfer(_amount);
    }

    // fallback function
    receive() external payable {}
}
