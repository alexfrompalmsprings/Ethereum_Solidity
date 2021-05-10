//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Lottery{
  // create an array to hold the addresses of all the players
  address payable[] public players;
  address public manager;

  constructor(){
    manager = msg.sender; // the address of the user interacting with the contract
  }





}