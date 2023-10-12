# Decentralized Marketplace Smart Contract Documentation

## Version Information

- **Solidity Version**: ^0.8.0
- **License**: UNLICENSED (SPDX-License-Identifier)
- **Author**: [Himanshu](https://github.com/Himasnhu-at) @ LearnTrinity.

## Overview

The "Decentralized Marketplace" smart contract is designed to create a decentralized platform where users can list, buy, and sell items or services using cryptocurrencies. This contract handles the secure escrow of funds, ensuring that transactions are reliable and trustworthy. Additionally, features like reviews and reputation systems can be integrated to enhance the marketplace's functionality.

## Contract Structure

### State Variables

1. **`items` (array of `Item`)**: An array that stores information about the items or services listed in the marketplace. Each `Item` includes details such as the seller's address, item description, price, and whether the item has been sold.

2. **`escrowedFunds` (mapping of address to uint)**: A mapping that holds escrowed funds for each buyer. When a buyer initiates a purchase, the required funds are held in escrow until the transaction is completed.

### Events

1. **`ItemListed`**: An event emitted when a new item is listed in the marketplace. It contains the following parameters:
    - `seller` (address): The Ethereum address of the seller.
    - `itemId` (uint): The unique identifier for the listed item.
    - `description` (string): The description of the listed item.
    - `price` (uint): The price of the item.

2. **`ItemPurchased`**: An event emitted when an item is successfully purchased from the marketplace. It contains the following parameters:
    - `buyer` (address): The Ethereum address of the buyer.
    - `seller` (address): The Ethereum address of the seller.
    - `itemId` (uint): The unique identifier for the purchased item.
    - `price` (uint): The price of the item.

### Struct

1. **`Item`**: A struct that defines the structure of an item or service listed in the marketplace. It includes the following fields:
   - `seller` (address): The Ethereum address of the seller.
   - `description` (string): The description of the listed item.
   - `price` (uint): The price of the item.
   - `sold` (bool): A flag indicating whether the item has been sold.

### Functions

1. **`listItem`**:
   - **Parameters**:
     - `description` (string): A description of the item or service.
     - `price` (uint): The price of the item or service.
   - **Description**: This function allows a user to list a new item or service in the marketplace. The function emits an "ItemListed" event, and the item is added to the marketplace's item list.

2. **`purchaseItem`**:
   - **Parameters**:
     - `itemId` (uint): The unique identifier of the item to be purchased.
   - **Description**: This function allows a user to purchase an item from the marketplace. The function handles the secure escrow of funds, ensuring that the buyer's payment is held until the transaction is successfully completed. Upon successful purchase, the item is marked as sold, and the funds are released to the seller. The function emits an "ItemPurchased" event.

3. **`getItems`**:
   - **Description**: This view function allows users to retrieve a list of all items or services listed in the marketplace, including details such as the seller's address, description, price, and availability.

4. **`getEscrowedFunds`**:
   - **Parameters**:
     - `buyer` (address): The Ethereum address of the buyer for whom you want to retrieve escrowed funds.
   - **Description**: This view function allows users to check the amount of funds held in escrow for a specific buyer. It provides transparency and ensures the security of funds during transactions.

5. **`leaveReview`**:
   - **Parameters**:
     - `itemId` (uint): The unique identifier of the purchased item.
     - `rating` (uint): The rating provided by the buyer (e.g., a 5-star rating).
     - `comment` (string): An optional text comment or review.
   - **Description**: This function enables buyers to leave reviews and ratings for items they have purchased. Reviews and ratings contribute to the reputation system of the marketplace, helping other users make informed decisions.

6. **`getReview`**:
   - **Parameters**:
     - `itemId` (uint): The unique identifier of the item for which you want to retrieve reviews and ratings.
   - **Description**: This view function allows users to access the reviews and ratings left by previous buyers for a specific item. It provides valuable information for potential buyers.

## Usage

1. **Listing Items**: Sellers can use the `listItem` function to list items or services in the decentralized marketplace. They provide a description and set a price for each item.

2. **Purchasing Items**: Buyers can initiate a purchase by calling the `purchaseItem` function, providing the unique identifier of the item they want to buy. The contract ensures that funds are held securely in escrow until the transaction is successfully completed.

3. **Retrieving Item Information**: Users can retrieve information about all listed items by calling the `getItems` function. This function provides details such as the seller's address, item description, price, and availability.

4. **Checking Escrowed Funds**: Buyers can verify the amount of funds held in escrow for a specific purchase by calling the `getEscrowedFunds` function. This adds an extra layer of security and transparency to the marketplace.

5. **Leaving Reviews and Ratings**: Buyers can contribute to the reputation system of the marketplace by leaving reviews and ratings for items they have purchased using the `leaveReview` function.

6. **Accessing Reviews and Ratings**: Users can access reviews and ratings for specific items by calling the `getReview` function. This information helps potential buyers make informed decisions when selecting items from the marketplace.

The "Decentralized Marketplace" smart contract offers a secure, transparent, and decentralized environment for peer-to-peer trading of items and services using cryptocurrencies. It enhances trust and security through an escrow system and provides valuable insights through a reputation and review system.
