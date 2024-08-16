// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {

    // Declare a state variable to store an integer. 
    int private storedNumber;

    // Function to store a value in the contract
    function store(int _number) public {
        storedNumber = _number; // Store the input number in the state variable
    }

    // Function to retrieve the stored value from the contract
    function retrieve() public view returns (int) {
        return storedNumber; // Return the stored number
    }
}
