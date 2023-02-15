//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import 'forge-std/Test.sol';
import '../src/FundingFactory.sol';

contract FundingFactoryTest is Test {

    FundingFactory public fundingFactory;

    event FundingContractCreated(address indexed newContract, uint indexed goal);


    function setUp() public {
        fundingFactory = new FundingFactory();
    }

    function testCreateFundingContract(uint goal) public {
        vm.expectEmit(false,true,false,false, address(fundingFactory));
        emit FundingContractCreated(address(777), goal);
        fundingFactory.createFundingContract(goal);
    }
}