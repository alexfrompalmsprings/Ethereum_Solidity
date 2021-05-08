// Consider the solution from the previous challenge.
// Add a function that transfers the entire balance of the contract to another address.
// Deploy and test the contract on Rinkeby Testnet.


//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Deposit{

  receive() external payable{}
  // a good article into what do we need to have in this external payable function
  // https://blog.soliditylang.org/2020/03/26/fallback-receive-split/

  function getBalance() public view returns(uint){
    return address(this).balance;

  }
  // Add a function that transfers the entire balance of the contract to another address.
  function transferBalance(address payable recipient) public{
      uint balance = getBalance();
      recipient.transfer(balance);
  }

}