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

  /*
    MODIFIER FUNCTIONS
    https://jeancvllr.medium.com/solidity-tutorial-all-about-modifiers-a86cf81c14cb
  */


  modifier notOwner(){
    // check the owner is not able to place a bid
    // owner can increase the price of the auction by placing fake bids
    require(msg.sender != owner);
    _; // this is called a wildcard ; It merges the function code with the modifier code where the _; is placed.
  }

  modifier afterStart(){
    require(block.number >= startBlock);
    _;
  }

  modifier beforeEnd(){
    require(block.number <= endBlock);
    _;
  }

  // function to check that the owner is the only person available to do an action
  modifier onlyOwner(){
    require(msg.sender == owner);
  }

  function min(uint a, uint b) pure internal returns(uint){
    if(a <= b){
      return a;
    } else{
      return b;
    }
  }

  function cancelAuction() public onlyOwner{
    auctionState = State.Canceled;
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