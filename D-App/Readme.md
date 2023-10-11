# Transactions

The "Transactions" smart contract is a simple Ethereum blockchain-based application that allows users to record and retrieve transactions. This documentation explains the purpose, structure, and usage of the smart contract.

## Version Information

- **Solidity Version**: 0.8.0
- **License**: UNLICENSED (SPDX-License-Identifier)
- **Author**: [Himasnhu-AT](https://github.com/Himasnhu-at) @ LearnTrinity.

## Overview

The "Transactions" smart contract serves as a basic ledger for recording financial transactions on the Ethereum blockchain. It provides the following core functionalities:

1. Recording transactions: Users can add new transactions to the ledger, specifying the receiver's address, the transaction amount, an optional message, and a keyword.
2. Retrieving all recorded transactions: Users can retrieve a list of all recorded transactions with their details.
3. Counting transactions: Users can obtain the total number of transactions recorded on the ledger.

## Contract Structure

### State Variables

1. **`transactionCount` (uint256)**: An integer to keep track of the total number of transactions recorded on the ledger.

2. **`transactions` (array of `TransferStruct`)**: An array that stores details of all recorded transactions.

### Events

1. **`Transfer`**: An event emitted when a new transaction is added to the ledger. This event contains the following parameters:
    - `from` (address): The sender's Ethereum address.
    - `receiver` (address): The receiver's Ethereum address.
    - `amount` (uint): The transaction amount in ether.
    - `message` (string): An optional message provided by the sender.
    - `timestamp` (uint256): The timestamp of the transaction.
    - `keyword` (string): A keyword associated with the transaction.

### Struct

1. **`TransferStruct`**: A struct that defines the structure of a transaction. It contains the following fields:
    - `sender` (address): The sender's Ethereum address.
    - `receiver` (address): The receiver's Ethereum address.
    - `amount` (uint): The transaction amount in ether.
    - `message` (string): An optional message provided by the sender.
    - `timestamp` (uint256): The timestamp of the transaction.
    - `keyword` (string): A keyword associated with the transaction.

### Functions

1. **`addToBlockchain`**:
   - **Parameters**:
     - `receiver` (address payable): The Ethereum address of the transaction receiver.
     - `amount` (uint): The transaction amount in ether.
     - `message` (string): An optional message associated with the transaction.
     - `keyword` (string): A keyword associated with the transaction.
   - **Description**: This function allows a user to add a new transaction to the ledger. The function increments the `transactionCount`, records the transaction details in the `transactions` array, and emits a "Transfer" event.

2. **`getAllTransactions`**:
   - **Description**: This view function allows users to retrieve a list of all recorded transactions, including sender, receiver, amount, message, timestamp, and keyword. It returns an array of `TransferStruct` elements.

3. **`getTransactionCount`**:
   - **Description**: This view function returns the total number of transactions recorded on the ledger.

## Usage

1. **Recording a Transaction**: To record a new transaction, call the `addToBlockchain` function, providing the receiver's address, transaction amount, an optional message, and a keyword.

2. **Retrieving All Transactions**: To retrieve a list of all recorded transactions, call the `getAllTransactions` function. It returns an array of `TransferStruct` elements, providing transaction details.

3. **Counting Transactions**: To obtain the total number of transactions recorded on the ledger, call the `getTransactionCount` function.