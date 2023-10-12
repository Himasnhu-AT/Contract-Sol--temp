# Multi-Signature Wallet Smart Contract Documentation

## Version Information

- **Solidity Version**: ^0.8.0
- **License**: UNLICENSED (SPDX-License-Identifier)
- **Author**: [Himanshu](https://github.com/Himasnhu-at) @ LearnTrinity.

## Overview

The "Multi-Signature Wallet" smart contract is designed to provide a secure and versatile solution for organizations and groups. It enforces the requirement for multiple parties to approve a transaction, ensuring that critical actions, such as fund transfers or other administrative functions, only proceed with the consensus of authorized signers. This type of contract is suitable for enhancing security and accountability within organizations.

## Contract Structure

### State Variables

1. **`owners` (array of address)**: An array that stores the Ethereum addresses of the wallet's owners or authorized signers. Each owner has the authority to approve transactions.

2. **`requiredSignatures` (uint)**: An integer that defines the minimum number of signatures required to approve a transaction. This number is set when the contract is created and can be modified by the owners.

### Events

1. **`TransactionApproved`**: An event emitted when a transaction is successfully approved by the required number of signers. It contains the following parameters:
    - `transactionId` (uint): The unique identifier for the approved transaction.
    - `destination` (address): The recipient address for the transaction.
    - `value` (uint): The value (in Ether) to be transferred.
    - `data` (bytes): Data associated with the transaction.
    - `approvedCount` (uint): The number of approvals received for the transaction.

2. **`OwnerAdded`**: An event emitted when a new owner is added to the multi-signature wallet. It contains the following parameter:
    - `newOwner` (address): The Ethereum address of the new owner.

3. **`OwnerRemoved`**: An event emitted when an owner is removed from the multi-signature wallet. It contains the following parameter:
    - `removedOwner` (address): The Ethereum address of the removed owner.

### Functions

1. **`submitTransaction`**:
   - **Parameters**:
     - `destination` (address): The recipient address for the transaction.
     - `value` (uint): The value (in Ether) to be transferred.
     - `data` (bytes): Data associated with the transaction.
   - **Description**: This function allows any owner to submit a transaction for approval. The transaction details are recorded, and if the required number of owners approve the transaction, it is executed.

2. **`approveTransaction`**:
    - **Parameters**:
      - `transactionId` (uint): The unique identifier for the transaction to be approved.
    - **Description**: This function allows an owner to approve a pending transaction. Once the required number of owners approve the transaction, it is executed.

3. **`executeTransaction`**:
    - **Parameters**:
      - `transactionId` (uint): The unique identifier for the transaction to be executed.
    - **Description**: This function allows any owner to execute a transaction that has received the required number of approvals. It transfers the specified value to the destination address and executes the associated data.

4. **`addOwner`**:
    - **Parameters**:
      - `newOwner` (address): The Ethereum address of the new owner to be added.
    - **Description**: This function allows an existing owner to add a new owner to the multi-signature wallet, expanding the list of authorized signers. This action requires consensus among current owners.

5. **`removeOwner`**:
    - **Parameters**:
      - `removedOwner` (address): The Ethereum address of the owner to be removed.
    - **Description**: This function allows an existing owner to remove an owner from the multi-signature wallet, reducing the list of authorized signers. This action requires consensus among current owners.

6. **`getOwners`**:
    - **Description**: This view function allows users to retrieve the list of current owners of the multi-signature wallet.

7. **`getTransactionCount`**:
    - **Description**: This view function returns the total number of pending transactions in the multi-signature wallet.

8. **`getTransaction`**:
    - **Parameters**:
      - `transactionId` (uint): The unique identifier for the transaction you want to retrieve.
    - **Description**: This view function allows users to retrieve the details of a specific transaction, including the destination address, value, data, and the number of approvals received.

9. **`changeRequiredSignatures`**:
    - **Parameters**:
      - `newRequiredSignatures` (uint): The new number of required signatures for transaction approval.
    - **Description**: This function allows owners to change the required number of signatures for transaction approval. This flexibility allows customization of security levels based on the organization's needs.

## Usage

1. **Submitting Transactions**: Owners can submit transactions using the `submitTransaction` function, specifying the destination address, value, and optional data.

2. **Approving Transactions**: Owners can approve pending transactions using the `approveTransaction` function. Once the required number of approvals is reached, the transaction is ready for execution.

3. **Executing Transactions**: Owners can execute approved transactions with the `executeTransaction` function. The transaction value is transferred to the destination address, and the associated data is executed.

4. **Managing Owners**: Existing owners can add new owners using the `addOwner` function or remove existing owners using the `removeOwner` function. These actions require consensus among current owners.

5. **Viewing Owners**: Users can retrieve the list of current owners by calling the `getOwners` function.

6. **Customizing Required Signatures**: Owners can change the required number of signatures for transaction approval using the `changeRequiredSignatures` function, allowing flexibility in security settings.

7. **Monitoring Transaction Count**: Users can check the total number of pending transactions by calling the `getTransactionCount` function.

8. **Retrieving Transaction Details**: Users can retrieve transaction details, including destination address, value, data, and approval count, by using the `getTransaction` function.

The "Multi-Signature Wallet" smart contract is a versatile and secure solution for organizations, enhancing the control and transparency of critical actions requiring multiple approvals. It provides flexibility in managing authorized signers and transaction security settings.