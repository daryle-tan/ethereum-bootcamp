// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    int8 public a = 1;
    int8 public b = -1;
    int16 public difference = a - b;

    bytes32 public msg1 = "Hello World";
    string public msg2 =
        "Hello you morons, Please be clearer with your instructions. Kthnx";

    enum Foods {
        Apple,
        Pizza,
        Bagel,
        Banana
    }

    Foods public food1 = Foods.Apple;
    Foods public food2 = Foods.Pizza;
    Foods public food3 = Foods.Bagel;
    Foods public food4 = Foods.Banana;
}
