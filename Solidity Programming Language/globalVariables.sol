//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract GlobalVariables{
    address public owner;
    uint public sentValue;

    constructor() public{
        owner = msg.sender;
    }

    function changeOwner() public{
        owner = msg.sender;
    }


    function sendEther() public payable{
        sentValue = msg.value;
    }

    function getBalance() public view returns(uint){
        return address(this).balance; // this => the current address
    }


     function howMuchGas() public view returns(uint){
        uint start = gasleft();
        uint j =1;

        for(uint i=1; i < 20; i++){
            j*=i;
        }

        uint end = gasleft();
        return start - end;


    }

}