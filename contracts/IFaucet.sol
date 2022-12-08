// SPDX-License-Identifier: MIT
pragma solidity = 0.8.17;

// They cannot inherit from other smart contracts, 
// only inherit from other interfaces
// They cannot declare a constructor
// They cannot declare state variables
// All of the function must be external

interface IFaucet {

    function addFunds() external payable;
    function withdraw(uint withdrawAmount) external;

}