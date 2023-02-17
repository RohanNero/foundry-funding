# Foundry-funding

a simple crowd funding dApp built with 100% solidity thanks to [foundry](https://book.getfoundry.sh/) :)

To create your own crowd funding smart contract all you need to do is call the `createSimpleFundingContract()` function on the **FundingFactory** contract. In addition to returning it directly, a `SimpleFundingContractCreated` event with the newly created contract's address is emitted by calling this function. The Only parameter you need to pass to the function is `goal`, the amount you want to raise/get funded in [wei](https://docs.soliditylang.org/en/v0.8.18/introduction-to-smart-contracts.html#accounts).

You may be thinking to yourself

_"why in sweet davey jones locker would you want to set the amount to be in terms of ETH instead of a less volatile currency‽"_

I'm aware it is a rather terrible design choice currently, but this project was made for **fun** and to get **acquanted with foundry**. If you want to build upon this project you probably would want to implement a less volatile currency or at the very least use a pricefeed.

---

## Test Naming Convention

Quick naming convention for organizational purposes, this would turn into chaos if used in anything more than a very basic contract.

- **Assert**

  - test calls a variation of the `assert` cheatcode and checks the value of a variable after a state change.
  - click this [link for list of assertions](https://book.getfoundry.sh/reference/ds-test#asserting).

- **Emit**

  - used for ensuring events were emitted correctly.
  - `expectEmit` cheatcode

- **Revert**
  - used for ensuring tests failed / were reverted; they may include custom errors
  - `expectRevert` cheatcode

Example tests:

```js
function testAssert_constructor() public {
    assertEq(funding.owner(),address(1337));
}

function testRevert_donate() public payable {
    vm.expectRevert(abi.encodeWithSelector(SimpleFunding__AtleastOneGwei.selector,msg.value,1e9));
    funding.donate();
}
```
