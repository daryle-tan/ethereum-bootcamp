// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Switch {
    address recipient;
    address owner;
    uint256 lastActivity;

    constructor(address _recipient) public payable {
        recipient = _recipient;
        owner = msg.sender;
        lastActivity = block.timestamp;
    }

    function withdraw() external {
        require(block.timestamp - lastActivity >= 52 weeks);
        (bool s, ) = recipient.call{value: address(this).balance}("");
        require(s);
    }

    function ping() external {
        require(msg.sender == owner, "Not the Owner!");
        lastActivity = block.timestamp;
    }
}
