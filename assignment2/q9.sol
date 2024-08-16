// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransactionLedger {
    // Structure to store transaction details
    struct Transaction {
        address sender;
        address receiver;
        uint256 amount;
        uint256 timestamp;
    }

    // Array to keep all transactions
    Transaction[] public transactions;

    // Function to record a new transaction
    function recordTransaction(address _receiver, uint256 _amount) public {
        // Create a new transaction
        Transaction memory newTransaction = Transaction({
            sender: msg.sender,
            receiver: _receiver,
            amount: _amount,
            timestamp: block.timestamp
        });

        // Add the transaction to the ledger
        transactions.push(newTransaction);
    }

    // Function to get the number of transactions
    function getTransactionCount() public view returns (uint256) {
        return transactions.length;
    }

    // Function to get a transaction by index
    function getTransaction(uint256 _index) public view returns (address sender, address receiver, uint256 amount, uint256 timestamp) {
        require(_index < transactions.length, "Index out of bounds");
        Transaction memory txn = transactions[_index];
        return (txn.sender, txn.receiver, txn.amount, txn.timestamp);
    }
}