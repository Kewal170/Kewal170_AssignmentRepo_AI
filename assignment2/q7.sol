// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Owned {
    // Address of the contract owner
    address public owner;

    // Modifier to restrict access to only the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    // Constructor to set the contract creator as the owner
    constructor() {
        owner = msg.sender;
    }

    // Function to change the owner (only callable by the current owner)
    function changeOwner(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid address");
        owner = newOwner;
    }

    // Example function restricted to the owner
    function restrictedFunction() public onlyOwner {
        // Only the owner can call this function
    }
}