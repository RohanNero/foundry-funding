// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Funding.sol";

contract FundingTest is Test {
    Funding public funding;

    function setUp() public {
        //vm.prank()
       funding = new Funding(777);
       //console.log('test deployer:', msg.sender);
    }

    function testSettingOwner() public {
        assertEq(funding.owner(),address(this));
    }

    function testGoalValue() public {
        assertEq(777,funding.viewGoal());
    }

    // function testConsoleLog() public view {
    //     console.log('test address:',address(this));
    // }

}
