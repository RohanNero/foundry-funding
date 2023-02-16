//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import 'forge-std/Test.sol';
import '../src/FundingFactory.sol';

contract FundingFactoryTest is Test {

    FundingFactory public fundingFactory;
    Funding public funding;

    event FundingContractCreated(address indexed newContract, uint indexed goal);


    function setUp() public {
        fundingFactory = new FundingFactory();
    }

    function testEmitCreateFundingContract(uint goal) public {
        vm.expectEmit(false,true,false,false, address(fundingFactory));
        emit FundingContractCreated(address(777), goal);
        fundingFactory.createFundingContract(goal);
    }
 
    function testReturnNewAddress(uint goal) public {
        address newAddr = fundingFactory.createFundingContract(goal);
        //console.log("newAddr: ",newAddr);
        funding = Funding(newAddr);
        uint viewedGoal = funding.viewGoal();
        //console.log("goal: ", viewedGoal);
        assertEq(goal,viewedGoal);
    }
}