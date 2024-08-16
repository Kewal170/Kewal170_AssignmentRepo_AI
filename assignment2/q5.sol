// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserNameStorage {

    // Mapping to store each user's name
    mapping(address => string) private names;

    // Function to store a user's name
    function setName(string memory _name) public {
        // Store the user's name in the mapping, using the sender's address as the key
        names[msg.sender] = _name;
    }

    // Function to retrieve the user's name
    function getName() public view returns (string memory) {
        // Retrieve the name from the mapping using the sender's address as the key
        return names[msg.sender];
    }
}
