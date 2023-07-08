// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Vote {
    enum Choices {
        Yes,
        No
    }

    // TODO: create a vote struct and a public state variable
    enum Choice {
        Left,
        Right
    }
    struct Vote {
        Choices choice;
        address voter;
    }

    Vote public vote;

    function createVote(Choices choice) external {
        // TODO: create a new vote
        vote = Vote(choice, msg.sender);
    }
}
