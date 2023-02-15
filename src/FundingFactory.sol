//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import '../src/Funding.sol';

contract FundingFactory {

    Funding private funding;

    event FundingContractCreated(address indexed newContract, uint indexed goal);

    function createFundingContract(uint _fundingGoal) public returns(address newAddr) {
        funding = new Funding(_fundingGoal);
        emit FundingContractCreated(address(funding), _fundingGoal);
        return address(funding);
    }
}