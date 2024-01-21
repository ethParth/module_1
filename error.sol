// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract error{

    //owner of the contract 

    address public owner;

    //mapping to keep a track of the amount

    mapping (address => uint) public amount;

    constructor (){

        //setting the deployer as the owner of the contract.

        owner = msg.sender;

    }

    function contribute() public payable{

        amount[msg.sender] += msg.value;
        if(msg.value <= 1000 wei){

            revert("The amount should be greater than 1000 Wei");
        }

         

    }

    function addMember(address _add) public payable{

        amount[_add] += msg.value;

        assert (_add != address(0));

        
    }

    function changeOwner(address _new) public{

        require(msg.sender == owner, "You are not the Owner");
        owner = _new;

    }


}

// 0x0000000000000000000000000000000000000000
