// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract MultiSignatureWallet {
    address public owner;
    uint public requiredSignatures;
    uint public transactionCount;
    mapping(uint => Transaction) public transactions;

    event TransactionApproved(uint indexed transactionId);
    event OwnerAdded(address indexed newOwner);
    event OwnerRemoved(address indexed removedOwner);

    struct Transaction {
        address destination;
        uint value;
        bytes data;
        bool executed;
        uint approvalCount;
        mapping(address => bool) approvals;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not an owner");
        _;
    }

    constructor(address _owner, uint _requiredSignatures) {
        owner = _owner;
        requiredSignatures = _requiredSignatures;
    }

    function submitTransaction(
        address _destination,
        uint _value,
        bytes memory _data,
        address[] memory _approvals
    ) public onlyOwner {
        uint transactionId = transactionCount;

        Transaction storage transaction = transactions[transactionId];
        transaction.destination = _destination;
        transaction.value = _value;
        transaction.data = _data;
        transaction.executed = false;
        transaction.approvalCount = 0;

        for (uint i = 0; i < _approvals.length; i++) {
            transaction.approvals[_approvals[i]] = false;
        }

        transactionCount++;
    }

    function approveTransaction(uint _transactionId) public onlyOwner {
        Transaction storage transaction = transactions[_transactionId];
        require(!transaction.approvals[msg.sender], "Already approved");

        transaction.approvals[msg.sender] = true;
        transaction.approvalCount++;

        if (transaction.approvalCount >= requiredSignatures) {
            executeTransaction(_transactionId);
        }

        emit TransactionApproved(_transactionId);
    }

    function executeTransaction(uint _transactionId) public onlyOwner {
        Transaction storage transaction = transactions[_transactionId];
        require(!transaction.executed, "Already executed");
        require(
            transaction.approvalCount >= requiredSignatures,
            "Not enough approvals"
        );

        transaction.executed = true;

        (bool success, ) = transaction.destination.call{
            value: transaction.value
        }(transaction.data);

        require(success, "Transaction failed");
    }

    function addOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
        emit OwnerAdded(_newOwner);
    }

    function removeOwner() public onlyOwner {
        owner = address(0); // Remove the owner by setting it to address(0)
    }

    function getOwners() public view returns (address) {
        return owner;
    }

    function getTransactionCount() public view returns (uint) {
        return transactionCount;
    }
}
