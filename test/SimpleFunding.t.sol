// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SimpleFunding.sol";

//error SimpleFunding__MustSendAtleastOneGwei(uint valueSent, uint oneGwei);

contract SimpleFundingTest is Test {
    uint testGoal = 1e10 + 777;
    SimpleFunding public funding;
    event DonationReceived(uint indexed amountDonated, uint indexed _totalDonated, uint indexed _goal);

    function setUp() public {
        vm.prank(address(0), address(1337));
        funding = new SimpleFunding(testGoal);
        //console.log('test deployer:', msg.sender);
    }

    function testSettingOwner() public {
        //console.log("leet:",address(1337));
        assertEq(funding.owner(),address(1337));
    }

    function testDonateRevert() public payable {
        vm.expectRevert(abi.encodeWithSelector(SimpleFunding__AtleastOneGwei.selector,msg.value,1e9));
        funding.donate();
    }

    function testDonate() public payable {
        funding.donate{value: 1e10}();
        assertEq(1e10, funding.viewTotalDonated());
    }

    function testDonateEvent() public payable {
        vm.expectEmit(true,true,true,false,address(funding));
        emit DonationReceived(1e10,1e10,testGoal);
        funding.donate{value: 1e10}();
    }




    /// 'bonus' tests

    function testGoalValue() public {
        assertEq(testGoal,funding.viewGoal());
    }

    // function testConsoleLog() public view {
    //     //console.log('test address:',address(this));
    // }

}
