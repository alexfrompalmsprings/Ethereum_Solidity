//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Lottery{

   // declaring the state variables
    address payable[] public players; //dynamic array of type address payable
    address public manager;


    // declaring the constructor
    constructor(){
    // initializing the owner to the address that deploys the contract
    manager = msg.sender; // cant be changed since we dont have a setter function to change the manager


    // to add the manager automatically to the library we can push the manager into the initial players []
    players.push(payable(manager));
    }

    // declaring the receive() function that is necessary to receive ETH
    receive () payable external{
      //  // the manager can not participate in the lottery
      //   require(msg.sender != manager);

        // each player sends exactly 0.1 ETH
        require(msg.value == 0.1 ether);
        // appending the player to the players array --- convert the address into payable addresses
        players.push(payable(msg.sender));
    }

  // helper function that returns a big random integer
    function random() internal view returns(uint){
       return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));
    }


    // selecting the winner
    function pickWinner() public{
        // only the manager can pick a winner if there are at least 3 players in the lottery
        require(msg.sender == manager);

        // needs to be at least 10 players
        require (players.length >= 10);

        uint r = random();
        address payable winner;

        // computing a random index of the array
        uint index = r % players.length;

        winner = players[index]; // this is the winner


        // change the contract so the manager receives 10% of the FEE
        uint managerFee = (getBalance() * 10) /100;

        uint winnerPrize = (getBalance() *  90) /100;



        // transferring the 90% of the prize to the winner
        winner.transfer((winnerPrize));

        // transferring the 90% of the prize to the winner
        payable(manager).transfer(managerFee);

        // resetting the lottery for the next round
        players = new address payable[](0);
    }

}