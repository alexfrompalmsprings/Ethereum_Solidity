// Question 1:
// Consider the following contract. What will be the value of the crypto dynamic array after calling myFunction()?


//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract A{
    string[] public crypto= ['BTC', 'ETH', 'BNB'];

    function myFunction() public{
        string[] memory s = crypto;
        s[2] = 'XMR';
    }
}

// ['BTH', 'ETH', 'BNB'];



// Consider the following contract.  If you call myFunction will the Blockchain state be altered?
// YESSS!!

//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract A{
    string[] public crypto= ['BTC', 'ETH', 'BNB'];

    function myFunction() public{
        string[] storage s = crypto;
        s[2] = 'XMR';
    }
}