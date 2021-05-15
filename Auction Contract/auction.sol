//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;


contract Auction{
  address payable public owner;
  uint public startBlock;
  uint public endBlock;
  string public ipfsHASH;

  enum State {
    Started,
    Running,
    Ended,
    Canceled
  }

  State public auctionState;


  uint public highestBindingBid;
  address payable public highestBidder;

  mapping(address => uint) public bids;
  uint bidIncrement;

  constructor(){
    owner = payable(msg.sender);
    auctionState = State.Running;
    startBlock = block.number;
    endBlock = startBlock + 40320;
    ipfsHASH = "";
    bidIncrement = 100;
  }

  modifier notOwner(){
    // check the owner is not able to place a bid
    // owner can increase the price of the auction by placing fake bids
    require(msg.sender != owner);
    _;
  }

  modifier afterStart(){
    require(block.number >= startBlock);
    _;
  }

  modifier beforeEnd(){
    require(block.number <= endBlock);
    _;
  }

  function min(uint a, uint b) pure internal returns(uint){
    if(a <= b){
      return a;
    } else{
      return b;
    }
  }



  function placeBid() public payable notOwner afterStart beforeEnd{
    require(auctionState == State.Running);
    require(msg.value >= 100);

    uint currentBid = bids[msg.sender] + msg.value;
    require(currentBid > highestBindingBid);

  bids[msg.sender] = currentBid;

  if(currentBid <= bids[highestBidder]){
    // create a helper function to find the min bid
    highestBindingBid = min(currentBid + bidIncrement, bids[highestBidder]);

  } else {
    highestBindingBid = min(currentBid, bids[highestBidder] + bidIncrement);
    highestBidder = payable(msg.sender);
  }

  }







}