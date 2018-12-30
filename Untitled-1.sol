pragma solidity ^0.4.24;

contract SimpleAuction{
    bytes32 public auctionlName;
    address public beneficiary;
    address public highestBidder;

    uint public auctionEnd;
    uint public highestOffer;11
    mapping(address=>uint) offers;
    bool ended;

    event HighestBidIncreased(address bidder,uint amount);
    event AuchtionEnded(address winner,uint amount);
    
    constructor(bytes32 _auctionlName, uint _biddingTime, address _beneficiary) public{
        auctionlName = _auctionlName;
        beneficiary = beneficiary;
        auctionEnd = block.timestamp + _biddingTime;
    }
    function bid() public payable{
        require(block.timestamp <= auctionEnd);
        require(msg.value > highestOffer);

        if(highestBidder != 0){
            offers[highestBidder] += highestOffer;
        }
        highestBidder = msg.sender;
        highestOffer = msg.value;
        HighestBidIncreased(msg.sender,msg.value);
    }
    
    function withdraw() public view returns(bool){
        uint amount = offers[msg.sender];
        if (amount > 0){
            offers[msg.sender] = 0;
            if (!msg.sender.send(amount)){
                offers[msg.sender] = amount;
                return false;
            }
        }
        return true;
    }
    function auctionEnd() public{
        require(block.timestamp >= auctionEnd);
        require(!ended);
        ended = true;
        AuchtionEnded(highestBidder, highestOffer);
        beneficiary.transfer(highestOffer);
    }
}