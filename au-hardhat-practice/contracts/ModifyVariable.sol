// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ModifyVariable {
    uint256 public x;
    // string public word;

    constructor(uint256 _x) {
        x = _x;
        
    }

    function modifyToLeet() public {
        x = 1337;
    }

    // function modifyToHola() public {
    //     word = "Hola";
    // }
}
