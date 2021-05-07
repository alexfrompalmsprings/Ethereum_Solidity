// Challenge #1
// Consider this Smart Contract.
// Change the state variable name to be declared as a public constant.
// Declare a setter and a getter function for the supply state variable.

//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract CryptosToken{

// Change the state variable name to be declared as a public constant.
    string constant public name = "Cryptos"; // string name = "Cryptos";
    uint supply;



// Declare a setter and a getter function for the supply state variable.
    function setSupply(uint s) public{
        supply = s;
    }

    function getSupply() public view returns(unit){
        return supply;
    }
}










