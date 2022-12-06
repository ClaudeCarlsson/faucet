// SPDX-License-Identifier: MIT
pragma solidity = 0.8.17;


contract Faucet {
    address[] public funders;

    // Special function 
    // It's called when a txn is made that doesn't specify 
    // function name

    // External function are part of the contract interface
    // which means that they can be called from other contracts and other
    // txns
    receive() external payable {}

    function addFunds() external payable {
        funders.push(msg.sender);
    }

    function getAllFunders() external view returns(address[] memory){
        return funders;
    }
}

// pure, view, no state change, ie no gas cost
// indicates that the function will not alter anyting
// pure wont even read the storage state 

// Block info
// Nounce - a hash that when combined with the mixhash 
// proofs that the block has gone through with proof of work
// 8 bytes => 64 bits


// instance.addFunds({value: "2000000000000"})
// const instance = await Faucet.deployed()