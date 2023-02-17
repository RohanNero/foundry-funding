# Foundry-funding

a simple crowd funding dApp built with 100% solidity thanks to [foundry](https://book.getfoundry.sh/) :)

To create your own crowd funding smart contract all you need to do is call the `createSimpleFundingContract()` function on the **FundingFactory** contract. By calling this function

---

## Test Naming Convention

Quick naming convention for organizational purposes, this would turn into chaos if used in anything more than a very basic contract.

- **Assert** - test calls a variation of the assert cheatcode and checks the value of a variable after a state change

- **Emit** - used for ensuring events were emitted correctly. (`expectEmit` cheatcode)

- **Revert** - used for ensuring tests failed / were reverted; they may include custom errors (`expectRevert` cheatcode)

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
