//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import 'forge-std/Test.sol';
import '../src/FundingFactory.sol';

contract FundingFactoryTest is Test {

    FundingFactory public fundingFactory;
    SimpleFunding public funding;

    event SimpleFundingContractCreated(address indexed newContract, uint indexed goal);


    function setUp() public {
        fundingFactory = new FundingFactory();
    }

    function testEmitCreateFundingContract(uint goal) public {
        vm.expectEmit(false,true,false,false, address(fundingFactory));
        emit SimpleFundingContractCreated(address(777), goal);
        fundingFactory.createSimpleFundingContract(goal);
    }
 
    function testReturnNewAddress(uint goal) public {
        address newAddr = fundingFactory.createSimpleFundingContract(goal);
        //console.log("newAddr: ",newAddr);
        funding = SimpleFunding(newAddr);
        uint viewedGoal = funding.viewGoal();
        //console.log("goal: ", viewedGoal);
        assertEq(goal,viewedGoal);
    }
}