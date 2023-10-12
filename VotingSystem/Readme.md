# Decentralized Voting System Smart Contract Documentation

## Version Information

- **Solidity Version**: ^0.8.0
- **License**: UNLICENSED (SPDX-License-Identifier)
- **Author**: [Himanshu](https://github.com/Himasnhu-at) @ LearnTrinity.

## Overview

The "Decentralized Voting System" smart contract is designed to provide a secure and transparent platform for users to participate in voting. This contract ensures that each user can cast their vote only once, preventing double-voting and ensuring the integrity of the voting process. This type of contract can be applied to various voting scenarios, including elections, decision-making within organizations, or community governance.

## Contract Structure

### State Variables

1. **`voters` (mapping of address to bool)**: A mapping that tracks whether each Ethereum address has already voted. If an address has voted, the corresponding value is set to `true`.

2. **`candidateList` (array of strings)**: An array that contains the list of candidates or voting options available.

3. **`votesReceived` (mapping of string to uint)**: A mapping that tracks the number of votes received by each candidate. The key is the candidate's name, and the value is the vote count.

### Events

1. **`Voted`**: An event emitted when a user casts their vote. It contains the following parameters:
    - `voter` (address): The Ethereum address of the voter.
    - `candidate` (string): The name of the candidate the voter has chosen.

### Functions

1. **`addCandidate`**:
   - **Parameters**:
     - `name` (string): The name of the candidate to be added to the candidate list.
   - **Description**: This function allows the contract owner to add a new candidate to the list of voting options.

2. **`vote`**:
    - **Parameters**:
      - `candidate` (string): The name of the candidate the voter wants to vote for.
    - **Description**: This function allows a registered voter to cast their vote for a specific candidate. The contract records the vote and prevents the voter from voting again.

3. **`getVoteCount`**:
    - **Parameters**:
      - `candidate` (string): The name of the candidate for which you want to retrieve the vote count.
    - **Description**: This view function returns the total number of votes received by a specific candidate.

4. **`getCandidateList`**:
    - **Description**: This view function returns the list of candidates available for voting.

5. **`hasVoted`**:
    - **Parameters**:
      - `voter` (address): The Ethereum address of the voter you want to check.
    - **Description**: This view function checks whether a specific voter has already cast a vote.

## Usage

1. **Adding Candidates**: The contract owner can add candidates to the list of voting options using the `addCandidate` function.

2. **Casting Votes**: Registered voters can use the `vote` function to cast their votes for their preferred candidates. The contract ensures that each voter can vote only once.

3. **Retrieving Vote Counts**: Anyone can use the `getVoteCount` function to retrieve the total number of votes received by a specific candidate.

4. **Retrieving Candidate List**: Users can obtain the list of candidates available for voting by calling the `getCandidateList` function.

5. **Checking if a Voter Has Voted**: The `hasVoted` function allows users to verify whether a specific voter has already cast a vote.
