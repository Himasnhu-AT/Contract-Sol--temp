// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract NFTMint {
    struct NFTStruct {
        string NFTName;
        string NFTDescription;
        uint NFTPrice;
        string NFTImage;
        address NFTOwner;
        uint256 NFTTimestamp;
    }

    NFTStruct[] public NFTs;
    uint256 public NFTCount = 0;

    event NFTUpload(
        string NFTName,
        string NFTDescription,
        uint NFTPrice,
        string NFTImage,
        address NFTOwner,
        uint256 NFTTimestamp
    );

    event NFTBuy(
        string NFTName,
        string NFTDescription,
        uint NFTPrice,
        string NFTImage,
        address NFTOwner,
        uint256 NFTTimestamp
    );

    function uploadNFT(
        string memory NFTName,
        string memory NFTDescription,
        uint NFTPrice,
        string memory NFTImage
    ) public {
        NFTs.push(
            NFTStruct({
                NFTName: NFTName,
                NFTDescription: NFTDescription,
                NFTPrice: NFTPrice,
                NFTImage: NFTImage,
                NFTOwner: msg.sender,
                NFTTimestamp: block.timestamp
            })
        );

        NFTCount++;

        emit NFTUpload(
            NFTName,
            NFTDescription,
            NFTPrice,
            NFTImage,
            msg.sender,
            block.timestamp
        );
    }

    function buyNFT(uint256 NFTIndex) public payable {
        require(NFTIndex < NFTs.length, "NFT does not exist.");
        NFTStruct storage nft = NFTs[NFTIndex];
        require(msg.value >= nft.NFTPrice, "Insufficient funds to buy NFT.");

        address payable previousOwner = payable(nft.NFTOwner);
        nft.NFTOwner = msg.sender;
        nft.NFTTimestamp = block.timestamp;

        previousOwner.transfer(msg.value);

        emit NFTBuy(
            nft.NFTName,
            nft.NFTDescription,
            nft.NFTPrice,
            nft.NFTImage,
            msg.sender,
            block.timestamp
        );
    }

    function getAllNFTs() public view returns (NFTStruct[] memory) {
        return NFTs;
    }

    function getNFTCount() public view returns (uint256) {
        return NFTCount;
    }
}
