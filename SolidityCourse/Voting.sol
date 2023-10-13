// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    event ProposalCreated(uint _proposalId);
    event VoteCast(uint, address indexed);

    enum VoteStates {
        Absent,
        Yes,
        No
    }
    uint constant VOTING_THRESHOLD = 10;

    struct Proposal {
        address target;
        bytes data;
        bool executed;
        uint yesCount;
        uint noCount;
        mapping(address => VoteStates) voteStates;
    }

    Proposal[] public proposals;
    mapping(address => bool) members;

    constructor(address[] memory _members) {
        for (uint i = 0; i < _members.length; i++) {
            members[_members[i]] = true;
        }
        members[msg.sender] = true;
    }

    function newProposal(address _target, bytes calldata _data) external {
        require(members[msg.sender]);
        emit ProposalCreated(proposals.length);
        Proposal storage proposal = proposals.push();

        proposal.target = _target;
        proposal.data = _data;
    }

    function castVote(uint proposalId, bool support) external {
        require(members[msg.sender]);

        Proposal storage proposal = proposals[proposalId];

        if (proposal.voteStates[msg.sender] == VoteStates.Yes) {
            proposal.yesCount--;
        }
        if (proposal.voteStates[msg.sender] == VoteStates.No) {
            proposal.noCount--;
        }

        if (support) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }

        proposal.voteStates[msg.sender] = support
            ? VoteStates.Yes
            : VoteStates.No;
        emit VoteCast(proposalId, msg.sender);

        if (proposal.yesCount == VOTING_THRESHOLD && !proposal.executed) {
            (bool success, ) = proposal.target.call(proposal.data);
            require(success);
        }
    }
}
