# NFT Minting

The "NFT Minting" smart contract is a simple Ethereum blockchain-based application that allows users to record and retrieve NFT's. This documentation explains the purpose, structure, and usage of the smart contract.

## Version Information

- **Solidity Version**: 0.8.0
- **License**: UNLICENSED (SPDX-License-Identifier)
- **Author**: [Himanshu](https://github.com/Himasnhu-at) @ LearnTrinity.

## Overview

The "NFTMint" smart contract serves as a basic ledger for recording NFT /based transactions on the Ethereum blockchain. It provides the following core functionalities:

1. Uploading NFT: It alows you to upload NFT's to the blockchain. The uploaded NFT's are stored in the blockchain, and visible to all the users so that they can buy it.

2. Buying NFT: It allows you to buy NFT's from the blockchain. The NFT's are stored in the blockchain, and visible to all the users so that they can buy it.

3. Counting NFT's: Users can obtain the total number of NFT's recorded on the ledger.

## Contract Structure

### State Variables

1. **`NFTCount` (uint256)**: An integer to keep track of the total number of NFT's recorded on the ledger.

2. **`NFTs` (array of `NFTStruct`)**: An array that stores details of all recorded NFT's.

### Events

1. **`NFTUpload`**: An event emitted when a new NFT is added to the ledger. This event contains the following parameters:
    - `NFTName` (string): The name of the NFT.
    - `NFTDescription` (string): The description of the NFT.
    - `NFTPrice` (uint): The price of the NFT.
    - `NFTImage` (string): The image of the NFT.
    - `NFTOwner` (address): The owner of the NFT.
    - `NFTTimestamp` (uint256): The timestamp of the NFT.

2. **`NFTBuy`**: An event emitted when a new NFT is bought from the ledger. This event contains the following parameters:
    - `NFTName` (string): The name of the NFT.
    - `NFTDescription` (string): The description of the NFT.
    - `NFTPrice` (uint): The price of the NFT.
    - `NFTImage` (string): The image of the NFT.
    - `NFTOwner` (address): The owner of the NFT.
    - `NFTTimestamp` (uint256): The timestamp of the NFT.

### Struct

1. **`NFTStruct`**: A struct that defines the structure of a NFT. It contains the following fields:
    - `NFTName` (string): The name of the NFT.
    - `NFTDescription` (string): The description of the NFT.
    - `NFTPrice` (uint): The price of the NFT.
    - `NFTImage` (string): The image of the NFT.
    - `NFTOwner` (address): The owner of the NFT.
    - `NFTTimestamp` (uint256): The timestamp of the NFT.

### Functions

1. **`uploadNFT`**:
   - **Parameters**:
     - `NFTName` (string): The name of the NFT.
     - `NFTDescription` (string): The description of the NFT.
     - `NFTPrice` (uint): The price of the NFT.
     - `NFTImage` (string): The image of the NFT.
   - **Description**: This function allows a user to add a new NFT to the ledger. The function increments the `NFTCount`, records the NFT details in the `NFTs` array, and emits a "NFTUpload" event.

2. **`buyNFT`**:
    - **Parameters**:
      - `NFTName` (string): The name of the NFT.
      - `NFTDescription` (string): The description of the NFT.
      - `NFTPrice` (uint): The price of the NFT.
      - `NFTImage` (string): The image of the NFT.
      - `NFTOwner` (address): The owner of the NFT.
      - `NFTTimestamp` (uint256): The timestamp of the NFT.
    - **Description**: This function allows a user to buy a NFT from the ledger. The function decrements the `NFTCount`, records the NFT details in the `NFTs` array, and emits a "NFTBuy" event.

3. **`getAllNFTs`**:
    - **Description**: This view function allows users to retrieve a list of all recorded NFT's, including name, description, price, image, owner, and timestamp. It returns an array of `NFTStruct` elements.

4. **`getNFTCount`**:
    - **Description**: This view function returns the total number of NFT's recorded on the ledger.

## Usage

1. **Uploading a NFT**: To upload a new NFT, call the `uploadNFT` function, providing the name, description, price, and image of the NFT.

2. **Buying a NFT**: To buy a NFT, call the `buyNFT` function, providing the name, description, price, image, owner, and timestamp of the NFT.

3. **Retrieving All NFT's**: To retrieve a list of all recorded NFT's, call the `getAllNFTs` function. It returns an array of `NFTStruct` elements, providing NFT details.

4. **Counting NFT's**: To obtain the total number of NFT's recorded on the ledger, call the `getNFTCount` function.

## Usage

1. **Uploading a NFT**: To upload a new NFT, call the `uploadNFT` function, providing the name, description, price, and image of the NFT.

2. **Buying a NFT**: To buy a NFT, call the `buyNFT` function, providing the name, description, price, image, owner, and timestamp of the NFT.

3. **Retrieving All NFT's**: To retrieve a list of all recorded NFT's, call the `getAllNFTs` function. It returns an array of `NFTStruct` elements, providing NFT details.

4. **Counting NFT's**: To obtain the total number of NFT's recorded on the ledger, call the `getNFTCount` function.
