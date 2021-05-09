// Consider this smart contract.
// Add a function called start() that adds the address of the account that calls it to the dynamic array called players.
// Deploy and test the contract on Rinkeby Testnet.



//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Game{
    address[] public players;
}