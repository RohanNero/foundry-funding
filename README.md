# Foundry-funding

a simple crowd funding dApp built with 100% solidity thanks to [foundry](https://book.getfoundry.sh/) :)

---

## Test Naming Convention

Quick naming convention for organizational purposes, this would turn into chaos if used in anything more than a very basic contract.

- **Assert** - test calls a variation of the assert cheatcode and checks the value of a variable after a state change

- **Emit** - used for ensuring events were emitted correctly. (`expectEmit` cheatcode)

- **Revert** - used for ensuring tests failed / were reverted; they may include custom errors (`expectRevert` cheatcode)
