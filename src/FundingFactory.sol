//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import '../src/Funding.sol';

/**
* @title FundingFactory
* @author Rohan Nero
* @notice this contract is for deploying Funding contracts
 */
contract FundingFactory {

    Funding private funding;

    event FundingContractCreated(address indexed newContract, uint indexed goal);

    /**
    * @notice this function creates Funding contracts
    * @dev createFundingContract() returns the newly created contract address and emits event with the address
    * @param _fundingGoal this sets the 'goal' variable inside Funding
     */
    function createFundingContract(uint _fundingGoal) public returns(address newAddr) {
        funding = new Funding(_fundingGoal);
        emit FundingContractCreated(address(funding), _fundingGoal);
        return address(funding);
    }
 
}