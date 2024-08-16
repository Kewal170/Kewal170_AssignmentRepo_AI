// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // Define an event to log actions
    event ActionPerformed(address indexed user, string action, uint256 value);

    // Function to perform an action and log it
    function performAction(string memory _action, uint256 _value) public {
        // Emit the event with details of the action
        emit ActionPerformed(msg.sender, _action, _value);
    }
}