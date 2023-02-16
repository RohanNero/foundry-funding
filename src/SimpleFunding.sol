// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import 'openzeppelin/contracts/access/Ownable.sol';

error SimpleFunding__AtleastOneGwei(uint valueSent, uint oneGwei);

/**
* @title Funding
* @author Rohan Nero
* @notice a foundry-built trustless crowdraiser
 */
contract SimpleFunding is Ownable{

    uint256 private _goal;
    uint256 private _totalDonated;

    event DonationReceived(uint indexed amountDonated, uint indexed _totalDonated, uint indexed _goal);
    

    
    /**
    * @notice sets _goal and owner variables 
    * @param goal amount you wish to raise in wei */
    constructor(uint256 goal) {
        _transferOwnership(tx.origin);
        if(goal < 1e9) {
            revert SimpleFunding__AtleastOneGwei(goal, 1e9);
        }
        _goal = goal;
    }


    /**
    * @notice this function keeps track of ether sent to contract */
    function donate() public payable{
        if (msg.value < 1e9) {
            revert SimpleFunding__AtleastOneGwei(msg.value, 1e9);
        }
        _totalDonated += msg.value;
        emit DonationReceived(msg.value, _totalDonated, _goal);
    }

    /// View/Pure functions

    /**@notice this function returns _goal */
    function viewGoal() public view returns(uint256) {
        return _goal;
    }
    
    /**@notice this function returns the contract's balance */
    function viewBal() public view returns(uint256) {
        return address(this).balance;
    }

    /**@notice this function returns the totalDonated variable */
    function viewTotalDonated() public view returns(uint256) {
        return _totalDonated;
    }

    // left off right here, just fleshing out the Funding contract with more logic. 
    // At the same time I write tests for it inside the Funding.t.sol file.
    // Need to remember to constantly push my changes to the github repo.
    
}
