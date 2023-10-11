# Solidity Smart Contract Documentation

## CrowdFunding

The "CrowdFunding" smart contract is a decentralized crowdfunding platform built on the Ethereum blockchain. It allows users to create and contribute to crowdfunding campaigns. This documentation explains the purpose, structure, and usage of the smart contract.

## Version Information

- **Solidity Version**: 0.8.9
- **License**: UNLICENSED (SPDX-License-Identifier)
- **Author**: [Himanshu](https://github.com/Himasnhu-AT) @ LearnTrinity.

## Overview

The "CrowdFunding" smart contract facilitates crowdfunding campaigns by offering the following core functionalities:

1. Creating Campaigns: Users can create new crowdfunding campaigns by providing details such as the campaign title, description, funding target, deadline, and an image associated with the campaign.

2. Contributing to Campaigns: Users can contribute to existing crowdfunding campaigns by sending Ether to the campaign owner's address.

3. Retrieving Campaign Information: Users can access information about specific campaigns, including campaign details, contributors, and the amount collected.

## Contract Structure

### Struct

1. **`Campaign`**: A struct that defines the structure of a crowdfunding campaign. It includes the following fields:

   - `owner` (address): The Ethereum address of the campaign owner.
   - `title` (string): The title of the campaign.
   - `description` (string): A description of the campaign.
   - `target` (uint256): The funding target (in Ether) for the campaign.
   - `deadline` (uint256): The deadline (timestamp) for the campaign.
   - `amountCollected` (uint256): The total amount (in Ether) collected for the campaign.
   - `image` (string): An optional image associated with the campaign.
   - `donators` (array of addresses): An array of addresses that have contributed to the campaign.
   - `donations` (array of uint256): An array of donation amounts corresponding to the donators.

### State Variables

1. **`campaigns` (mapping of uint256 to `Campaign`)**: A mapping that stores information about all crowdfunding campaigns. Campaigns are identified by unique IDs (uint256).

2. **`numberOfCampaigns` (uint256)**: A variable that keeps track of the total number of campaigns created.

### Functions

1. **`createCampaign`**:

   - **Parameters**:
     - `owner` (address): The Ethereum address of the campaign owner.
     - `title` (string): The title of the campaign.
     - `description` (string): A description of the campaign.
     - `target` (uint256): The funding target (in Ether) for the campaign.
     - `deadline` (uint256): The deadline (timestamp) for the campaign.
     - `image` (string): An optional image associated with the campaign.

   - **Description**: This function allows a user to create a new crowdfunding campaign. It verifies that the deadline is set to a future date, initializes the campaign details, and increments the `numberOfCampaigns` variable.

   - **Returns**: The unique ID of the created campaign.

2. **`donateToCampaign`**:

   - **Parameters**:
     - `id` (uint256): The unique ID of the campaign to which the user wants to contribute.

   - **Description**: This function enables users to contribute Ether to a specific crowdfunding campaign. The contributed Ether is sent to the campaign owner's address, and the donation is recorded along with the contributor's address.

3. **`getDonators`**:

   - **Parameters**:
     - `id` (uint256): The unique ID of the campaign for which you want to retrieve contributor information.

   - **Description**: This view function returns an array of contributors' addresses and their corresponding donation amounts for a specific campaign.

   - **Returns**: An array of addresses and donation amounts.

4. **`getCampaigns`**:

   - **Description**: This view function returns an array of all crowdfunding campaigns, including their details.

   - **Returns**: An array of `Campaign` structures, representing all created campaigns.

## Usage

1. **Creating a Campaign**: To create a new crowdfunding campaign, call the `createCampaign` function with the required parameters, including the campaign owner's address, title, description, target amount, deadline, and an optional image.

2. **Contributing to a Campaign**: Users can contribute to existing campaigns by calling the `donateToCampaign` function, specifying the campaign ID and sending Ether.

3. **Retrieving Campaign Information**: Users can retrieve information about specific campaigns, including details, contributors, and the total amount collected, by calling the `getDonators` and `getCampaigns` functions.