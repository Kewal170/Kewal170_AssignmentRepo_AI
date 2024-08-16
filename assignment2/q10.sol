// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MessageStorage {
    // State variable to store the message
    string private message;

    // Function to set the message
    function setMessage(string memory _message) public {
        message = _message;
    }

    // Function to retrieve the message
    function getMessage() public view returns (string memory) {
        return message;
    }
}
