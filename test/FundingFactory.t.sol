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

    function testRevert_CreateFundingContract() public {
        vm.expectRevert(abi.encodeWithSelector(SimpleFunding__AtleastOneGwei.selector,777,1e9));
        fundingFactory.createSimpleFundingContract(777);
    }

    function testEmit_CreateFundingContract(uint goal) public {
        goal = bound(goal, 1e9,2**256-1);
        vm.expectEmit(false,true,false,false, address(fundingFactory));
        emit SimpleFundingContractCreated(address(1337), goal);
        fundingFactory.createSimpleFundingContract(goal);
    }
 
    function testReturn_CreateFundingContract(uint goal) public {
        goal = bound(goal,1e9,2**256-1);
        address newAddr = fundingFactory.createSimpleFundingContract(goal);
        //console.log("newAddr: ",newAddr);
        funding = SimpleFunding(newAddr);
        uint viewedGoal = funding.viewGoal();
        //console.log("goal: ", viewedGoal);
        assertEq(goal,viewedGoal);
    }
}