// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Collectible {
    event Deployed(
        address indexed /** owner */
    );
    event Transfer(
        address indexed, /** owner */
        address indexed /* newOwner*/
    );
    event ForSale(uint, uint);
    event Purchase(
        uint, /* purchaseAmount */
        address indexed /* buyer */
    );

    address s_owner;
    uint s_purchaseAmount;

    constructor() {
        s_owner = msg.sender;
        emit Deployed(msg.sender);
    }

    function transfer(address recipient) external {
        require(s_owner == msg.sender, "Not the current owner");
        s_owner = recipient;
        emit Transfer(msg.sender, recipient);
    }

    function markPrice(uint askingPrice) external {
        require(msg.sender == s_owner, "Not the current owner!");
        s_purchaseAmount = askingPrice;
        emit ForSale(askingPrice, block.timestamp);
    }

    function purchase() external payable {
        require(msg.value == s_purchaseAmount, "Didn't send enough funds!");
        require(s_purchaseAmount > 0, "No longer for sale!");
        // collectible no longer for sale
        s_purchaseAmount = 0;
        // msg.value => seller
        (bool success, ) = s_owner.call{value: msg.value}("");
        require(success);
        // owner => buyer
        s_owner = msg.sender;

        emit Purchase(msg.value, msg.sender);
    }
}
