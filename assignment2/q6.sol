// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Define a contract named Voting
contract Voting {

    // Declare a structure to represent a candidate
    struct Candidate {
        uint256 id;                                             // Unique ID for the candidate
        string name;                                            // Name of the candidate
        uint256 voteCount;                                      // Number of votes received by the candidate
    }

    // State variables
    Candidate[] public candidates;                              // Array of all candidates
    mapping(address => bool) public hasVoted;                   // Mapping to keep track of addresses that have voted
    mapping(uint256 => uint256) public candidateVotes;          // Mapping to track votes for each candidate ID

    // Event that is emitted when a vote is cast
    event VoteCast(address indexed voter, uint256 candidateId);

    constructor(string[] memory candidateNames) {
        for (uint256 i = 0; i < candidateNames.length; i++) {   // Loop through the candidate names and create Candidate structs
            candidates.push(Candidate({
                id: i,
                name: candidateNames[i],
                voteCount: 0
            }));
        }
    }

    // Function to vote for a candidate
    // It accepts the candidate's ID as input
    function vote(uint256 candidateId) public {
        require(!hasVoted[msg.sender], "You have already voted."); 
        require(candidateId < candidates.length, "Invalid candidate ID."); 

        hasVoted[msg.sender] = true;
        
        candidates[candidateId].voteCount += 1;

        emit VoteCast(msg.sender, candidateId);
    }

    // Function to get the number of votes for a candidate
    function getVotes(uint256 candidateId) public view returns (uint256) {
        require(candidateId < candidates.length, "Invalid candidate ID."); // Check if the candidate ID is valid
        return candidates[candidateId].voteCount; // Return the vote count
    }

    // Function to get the list of candidates
    function getCandidates() public view returns (Candidate[] memory) {
        return candidates; // Return the list of candidates
    }
}
