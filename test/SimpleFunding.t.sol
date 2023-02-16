// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SimpleFunding.sol";

contract SimpleFundingTest is Test {
    SimpleFunding public funding;

    function setUp() public {
        vm.prank(address(0), address(1337));
       funding = new SimpleFunding(777);
       //console.log('test deployer:', msg.sender);
    }

    function testSettingOwner() public {
        console.log("leet:",address(1337));
        assertEq(funding.owner(),address(1337));
    }

    function testGoalValue() public {
        assertEq(777,funding.viewGoal());
    }

    function testConsoleLog() public view {
        console.log('test address:',address(this));
    }

}
