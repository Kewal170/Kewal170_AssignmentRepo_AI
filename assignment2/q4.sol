// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {

    uint256 private count;

    // Function to increment the count by 1
    function increment() public {
        count += 1; // Increase the count by 1
    }

    // Function to get the current value of the count
    function getCount() public view returns (uint256) {
        return count; // Return the current count
    }
}
