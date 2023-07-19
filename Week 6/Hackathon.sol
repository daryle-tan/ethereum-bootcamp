// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Hackathon {
    struct Project {
        string title;
        uint[] ratings;
    }

    Project[] projects;

    // TODO: add the findWinner function
    function findWinner() external view returns (Project memory winner) {
        uint256 topAverage = 0;
        for (uint256 i = 0; i < projects.length; i++) {
            uint256 sum;
            for (uint256 j = 0; j < projects[i].ratings.length; j++) {
                sum += projects[i].ratings[j];
            }
            uint256 average = sum / projects[i].ratings.length;
            if (average > topAverage) {
                topAverage = average;
                winner = projects[i];
            }
        }
        return winner;
    }

    function newProject(string calldata _title) external {
        // creates a new project with a title and an empty ratings array
        projects.push(Project(_title, new uint[](0)));
    }

    function rate(uint _idx, uint _rating) external {
        // rates a project by its index
        projects[_idx].ratings.push(_rating);
    }
}
