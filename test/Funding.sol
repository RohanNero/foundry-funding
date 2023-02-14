// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Funding.sol";

contract FundingTest is Test {
    Funding public funding;

    function setUp() public {
       funding = new Funding();
    }

}
