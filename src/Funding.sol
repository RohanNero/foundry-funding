// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import 'openzeppelin/contracts/access/Ownable.sol';

/**
* @author Rohan Nero
* @title Funding
* @notice a foundry-built trustless crowdraiser
 */
contract Funding is Ownable{

    uint256 private _goal;

    
    constructor(uint256 goal) {
        //_transferOwnership(tx.origin);
        _goal = goal;
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

    
}
