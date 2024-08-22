// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    // Public variable to store the manager's address (the person who deployed the contract)
    address public manager;
    
    // Array to store the addresses of players who join the lottery
    address[] public players;

    // Constructor function that runs once when the contract is deployed
    constructor() {
        manager = msg.sender; // Set the manager to the address that deploys the contract
    }

    // Function that allows players to enter the lottery by sending Ether
    function enter() public payable {
        require(msg.value > .01 ether, "Minimum Ether not met"); // Minimum amount to enter
        players.push(msg.sender); // Add the player's address to the array
    }

    // Private function to generate a pseudo-random number
    function random() private view returns (uint) {
        // Combine some variables and hash them to get a number
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
    }

    // Function to pick a random winner (only callable by the manager)
    function pickWinner() public restricted {
        uint index = random() % players.length; // Get a random index from the players array
        address winner = players[index]; // Get the address of the winner
        payable(winner).transfer(address(this).balance); // Send all Ether in the contract to the winner
        players = new address[](0);
        // Reset the players array to an empty array for the next round
    }

    // Modifier to restrict certain functions to only be called by the manager
    modifier restricted() {
        require(msg.sender == manager, "Only manager can call this function"); // Check if the caller is the manager
        _; // Continue execution
    }

    // Function to get the list of all players
    function getPlayers() public view returns (address[] memory) {
        return players; // Return the array of player addresses
    }
}