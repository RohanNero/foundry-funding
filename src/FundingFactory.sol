//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import '../src/SimpleFunding.sol';

/**
* @title FundingFactory
* @author Rohan Nero
* @notice this contract is for deploying Funding contracts
 */
contract FundingFactory {

    SimpleFunding private funding;
    
    /**@param newContract the address of your new `SimpleFunding` contract that was created
    * @param goal the amount you want to raise in WEI */
    event SimpleFundingContractCreated(address indexed newContract, uint indexed goal);

    /**
    * @notice this function creates Funding contracts
    * @dev createFundingContract() returns the newly created contract address and emits event with the address
    * @param _fundingGoal this sets the 'goal' variable inside Funding
     */
    function createSimpleFundingContract(uint _fundingGoal) public returns(address newAddr) {
        funding = new SimpleFunding(_fundingGoal);
        emit SimpleFundingContractCreated(address(funding), _fundingGoal);
        return address(funding);
    }
 
}