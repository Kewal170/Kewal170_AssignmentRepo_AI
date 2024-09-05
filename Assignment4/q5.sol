// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract DonationContract {
    // Event that is emitted when a donation is made
    event DonationMade(address indexed donor, address indexed recipient, uint256 amount);

    // Mapping to keep track of donations made by address
    mapping(address => mapping(address => uint256)) public donations;

    // Function to make a donation to a specific recipient
    function donate(address recipient) external payable {
        require(msg.value > 0, "Donation amount must be greater than zero");
        require(recipient != address(0), "Invalid recipient address");

        // Update the donation mapping
        donations[msg.sender][recipient] += msg.value;

        // Emit an event for the donation
        emit DonationMade(msg.sender, recipient, msg.value);
    }

    // Function to withdraw funds from the contract (only by the contract owner)
    function withdraw(uint256 amount) external {
        require(amount > 0, "Withdrawal amount must be greater than zero");
        require(address(this).balance >= amount, "Insufficient contract balance");

        payable(msg.sender).transfer(amount);
    }

    // Function to get the balance of the contract
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // Function to get the total amount donated by a specific donor to a recipient
    function getDonation(address donor, address recipient) external view returns (uint256) {
        return donations[donor][recipient];
    }
}
