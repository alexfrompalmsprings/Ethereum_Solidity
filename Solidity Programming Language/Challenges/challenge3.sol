// Modify the changeTokens() function in such a way that it changes the state variable called tokens.
//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract MyTokens{
    string[] public tokens = ['BTC', 'ETH'];

    function changeTokens() public view{
        // string[] memory t = tokens;
        // Explanation: In solidity, when storage type variable is assigned to memory type it creates a new copy of data.
        // If any update is done on copied data, it will not reflect in the original copy.
        string[] storage t = tokens;
        t[0] = 'VET';
    }

}

// nice little medium article to explain storage vs memory
// link ---> https://medium.com/coinmonks/what-the-hack-is-memory-and-storage-in-solidity-6b9e62577305#:~:text=Storage%3A%20The%20persistent%20memory%20that,the%20execution%20of%20the%20function.&text=It%20costs%20same%20as%20memory,a%20limited%20amount%20of%20values.