// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Contract {
    enum Choices {
        Yes,
        No
    }

    struct Vote {
        Choices choice;
        address voter;
    }

    // TODO: create a public state variable: an array of votes
    Vote[] public votes;

    Vote none = Vote(Choices(0), address(0));

    function createVote(Choices choice) external {
        // TODO: add a new vote to the array of votes state variable
        votes.push(Vote(choice, msg.sender));
    }

    function findVote(address voter) internal view returns (Vote storage) {
        for (uint i = 0; i < votes.length; i++) {
            if (voter == votes[i].voter) {
                return votes[i];
            }
        }
        return none;
    }

    function hasVoted(address _voter) external view returns (bool) {
        return findVote(_voter).voter == _voter;
    }

    function findChoice(address _voter) external view returns (Choices) {
        return findVote(_voter).choice;
    }
}
