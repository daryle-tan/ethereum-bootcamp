// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Voting {
    event ProposalCreated(uint);
    event VoteCast(uint, address);

    enum VoteStates {
        Absent,
        Yes,
        No
    }

    uint256 constant THRESHOLD_VOTE = 10;

    struct Proposal {
        bool executed;
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        mapping(address => VoteStates) voteStates;
    }
    Proposal[] public proposals;

    mapping(address => bool) members;

    constructor(address[] memory _members) public {
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

    function castVote(uint _proposalId, bool _support) external {
        require(members[msg.sender]);
        Proposal storage proposal = proposals[_proposalId];

        if (proposal.voteStates[msg.sender] == VoteStates.Yes) {
            proposal.yesCount--;
        }
        if (proposal.voteStates[msg.sender] == VoteStates.No) {
            proposal.noCount--;
        }

        if (_support) {
            proposal.yesCount++;
        } else {
            proposal.noCount++;
        }

        if (proposal.yesCount == THRESHOLD_VOTE && !proposal.executed) {
            (bool s, ) = proposal.target.call(proposal.data);
            require(s);
        }

        proposal.voteStates[msg.sender] = _support
            ? VoteStates.Yes
            : VoteStates.No;
        emit VoteCast(_proposalId, msg.sender);
    }
}
