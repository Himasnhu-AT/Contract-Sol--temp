// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract DecentralizedMarketplace {
    address public owner;

    struct Item {
        address seller;
        string description;
        uint price;
        bool sold;
    }

    Item[] public items;
    mapping(address => uint) public escrowedFunds;
    mapping(uint => Review[]) public itemReviews;

    event ItemListed(
        address indexed seller,
        uint indexed itemId,
        string description,
        uint price
    );
    event ItemPurchased(
        address indexed buyer,
        address indexed seller,
        uint indexed itemId,
        uint price
    );

    struct Review {
        uint rating;
        string comment;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function listItem(string memory _description, uint _price) public {
        items.push(
            Item({
                seller: msg.sender,
                description: _description,
                price: _price,
                sold: false
            })
        );
        emit ItemListed(msg.sender, items.length - 1, _description, _price);
    }

    function purchaseItem(uint _itemId) public payable {
        require(_itemId < items.length, "Invalid item ID");
        Item storage item = items[_itemId];
        require(!item.sold, "Item already sold");
        require(msg.value == item.price, "Incorrect payment amount");
        require(msg.sender != item.seller, "Cannot buy own item");

        escrowedFunds[msg.sender] += msg.value;
        item.sold = true;
        payable(item.seller).transfer(msg.value);
        emit ItemPurchased(msg.sender, item.seller, _itemId, item.price);
    }

    function getItems() public view returns (Item[] memory) {
        return items;
    }

    function getEscrowedFunds(address _buyer) public view returns (uint) {
        return escrowedFunds[_buyer];
    }

    function leaveReview(
        uint _itemId,
        uint _rating,
        string memory _comment
    ) public {
        require(_itemId < items.length, "Invalid item ID");
        require(_rating >= 1 && _rating <= 5, "Invalid rating");

        itemReviews[_itemId].push(Review({rating: _rating, comment: _comment}));
    }

    function getReviews(uint _itemId) public view returns (Review[] memory) {
        return itemReviews[_itemId];
    }
}
