// Challenge #4
// Consider this Smart Contract.
// Add a function so that the contract can receive ETH by sending it directly to the contract address.
// Return the contract’s balance.
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

}