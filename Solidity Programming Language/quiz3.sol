// SPDX-License-Identifier: GPL-3.0

// Question 1:
// Is it possible to get the value of the price state variable?


// QUESTION #1 - Is it possible to get the value of the price state variable?
// Answer: Price is a public variable and for public variables a getter is automatically created.

pragma solidity >=0.5.0 <0.9.0;

contract Property{
    uint public price;

    constructor(uint _price){
        price = _price;
    }

    function setPrice(uint _price) public {
        price = _price;
    }
}



// Question 2:
// What is the value of the price and sold state variables after contract deployment?
// Answer: Until initiation the value equals to zero and the the boolean should be false


pragma solidity >=0.5.0 <0.9.0;

contract Property{
    uint public price; // ZERO
    bool public sold; // False

    function setPrice(uint _price) public {
        price = _price;
    }
}



// Question 3:
// How much gas costs to get the value of the price state variable?
// Answer: This is a call, not a transaction. It doesn't modify the blockchain and it doesn't cost gas.


pragma solidity >=0.5.0 <0.9.0;

contract Property{
    uint public price;

    constructor(uint _price){
        price = _price;
    }

    function setPrice(uint _price) public {
        price = _price;
    }
}


// Question 4:
// Will compile the following contract?
// Answer: NOPE, reassigning a variable is not pertmitted; only at iniation


pragma solidity >=0.5.0 <0.9.0;

contract Property{
    uint public price;
    // price = 700; // this an error; can't reassign a variable

    constructor(uint _price){
        price = _price;
    }

    function setPrice(uint _price) public {
        price = _price;
    }
}


// Question 5:
// After deploying the following smart contract the admin wants to add another state variable named location. How would he do that?
// Answer: The view keyword means that the function doesn't modify the blockchain, but this function modifies the blockchain (the state variable named price). It won't work.



pragma solidity >=0.5.0 <0.9.0;

contract Property{
    uint public price;

    function setPrice(uint _price) public {
        price = _price;
    }
}


// Question 6:
// A developer creates the following setter function. Is that correct?
// Answer: He must modify the contract source code and deploy a new instance on the blockchain.

    function setPrice(uint _price) view public {
        price = _price;
    }


// Question 7:
// The following contract doesn't compile. Why?
// Answer: If the function returns a value we must specify in its signature what it returns. The correct function signature is: function getPrice(uint _price) public returns(uint) {...}

pragma solidity >=0.5.0 <0.9.0;

contract Property{
    uint public price;

    function getPrice() public view{
        return price;
    }
}



// Question 8:
// Choose the correct statement.
// Answer:
// | _location saved on memory
// | location saved on storage
// | x local variable


pragma solidity >=0.5.0 <0.9.0;

contract Property{
  string public location = "Paris";

  function f1 (uint x) public{
     string memory _location = "Berlin";
     _location = location;

     x = 10;
     uint y = 20;

  }
}


// Question 9:
// Choose the correct statement.
// Answer: The constructor is automatically executed only at contract deployment time.


// pragma solidity >=0.5.0 <0.9.0;

// contract Property{
//     uint private price;

//     constructor(uint _price){
//         price = _price;
//     }
// }