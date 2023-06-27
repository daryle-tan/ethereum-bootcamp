// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Enum {
    enum Foods { Apple, Pizza, Bagel, Banana }

	Foods public food1 = Foods.Apple;
	Foods public food2 = Foods.Pizza;
	Foods public food3 = Foods.Bagel;
	Foods public food4 = Foods.Banana;
}

contract BytesString {
	 bytes32 public msg1 = "Hello World";
    string public msg2 = "I want to greet this world with my arms";
}

contract Int {
    int public a = 10;
    int public b = -3;
    int public difference = a - b;
}

contract Uint {
    uint8 public a = 1;
    uint16 public b = 256;
    uint256 public sum = a + b;
}

contract Boolean {
	bool public a = true;
    bool public b = false;
}
