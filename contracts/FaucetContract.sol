// SPDX-License-Identifier: MIT
pragma solidity = 0.8.17;

import "./owned.sol";

contract Faucet is Owned{

    uint public numberOfFunders;

    mapping(address => bool) private funders;
    mapping(uint => address) private lutFunders;

    modifier limitWithdraw(uint withdrawAmount) {
        require(
            withdrawAmount <= 100000000000000000, 
            "Can not withdraw more than one 0.1 ether"
        );
        _;
    }

    // Special function 
    // It's called when a txn is made that doesn't specify 
    // function name

    // External function are part of the contract interface
    // which means that they can be called from other contracts and other
    // txns
    receive() external payable {}

    function transferOwnership(address newOwner) external onlyOwner {
        owner = newOwner;
    }

    function addFunds() external payable {
        address funder = msg.sender;
        if (!funders[funder]) {
            funders[funder] = true;
            lutFunders[numberOfFunders] = funder;
            numberOfFunders++;
        }
    }

    function test1() external onlyOwner{
        // Only admin should have access to
    }

    function test2() external onlyOwner{
        // Only admin should have access to
    }

    function withdraw(uint withdrawAmount) external limitWithdraw(withdrawAmount){
        payable(msg.sender).transfer(withdrawAmount); 
    }

    function getAllFunders() external view returns(address[] memory) {
        address[] memory _funders = new address[](numberOfFunders);

        for (uint i = 0; i < numberOfFunders; i++) {
            _funders[i] = lutFunders[i];
        }

        return _funders;
    }

    function getFunderAtIndex(uint8 index) external view returns(address) {
        return lutFunders[index];
    }
}

// pure, view, no state change, ie no gas cost
// indicates that the function will not alter anyting
// pure wont even read the storage state 

// Block info
// Nounce - a hash that when combined with the mixhash 
// proofs that the block has gone through with proof of work
// 8 bytes => 64 bits


// const instance = await Faucet.deployed()

// instance.addFunds({from: accounts[0], value: "2000000000000000000"})
// instance.addFunds({from: accounts[1], value: "2000000000000000000"})

// instance.getFunderAtIndex(0)

// instance.withdraw("500000000000000000", {from: accounts[0]})