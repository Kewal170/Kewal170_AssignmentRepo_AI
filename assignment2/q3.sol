// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PersonalizedGreeting {

    // Mapping to store greeting messages for each user
    mapping(address => string) private greetings;

    // Function to set a personalized greeting message
    function setGreeting(string memory _greeting) public {
        // Store the greeting message in the mapping, using the sender's address as the key
        greetings[msg.sender] = _greeting;
    }

    // Function to get the personalized greeting message of the caller
    function getGreeting() public view returns (string memory) {
        // Retrieve the greeting message from the mapping using the sender's address as the key
        return greetings[msg.sender];
    }
}
