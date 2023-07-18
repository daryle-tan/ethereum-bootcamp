// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Party {
    mapping(address => bool) paid;
    uint256 s_deposit;
    address[] s_attendees;

    constructor(uint256 _deposit) {
        s_deposit = _deposit;
    }

    function rsvp() external payable {
        require(msg.value == s_deposit, "Not the correct amount sent");
        require(!paid[msg.sender], "Can't rsvp again!");
        s_attendees.push(msg.sender);
        paid[msg.sender] = true;
    }

    function payBill(address venue, uint256 amount) external {
        (bool s, ) = venue.call{value: amount}("");
        require(s);
        // find out how many attendees there were
        // divide the fund by the number of attendees
        uint256 share = address(this).balance / s_attendees.length;
        // loop the array of attendees and distribute the amount to each attendee
        for (uint256 i = 0; i < s_attendees.length; i++) {
            (bool s2, ) = s_attendees[i].call{value: share}("");
            require(s2);
        }
    }
}
