// Consider the solution from the previous challenge.
// Add a new immutable state variable called admin and initialize it with the address of the account that deploys the contract;
// Add a restriction so that only the admin can transfer the balance of the contract to another address;




//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Deposit{
  // Add a new immutable state variable called admin and initialize it with the address of the account that deploys the contract;
  address public immutable admin;
  // whats the difference about immutable and constant variables?

  /*
  State variables can be declared as constant or immutable.
  In both cases, the variables cannot be modified after the contract has been constructed.
  For constant variables, the value has to be fixed at compile-time,
  while for immutable, it can still be assigned at construction time.
  */


  receive() external payable{}


  function getBalance() public view returns(uint){
    return address(this).balance;

  }


  function transferBalance(address payable recipient) public{
  // Add a restriction so that only the admin can transfer the balance of the contract to another address;
    require(admin == msg.sender);

    // whats require?
    // https://www.bitdegree.org/learn/solidity-require


      uint balance = getBalance();
      recipient.transfer(balance);
  }

}