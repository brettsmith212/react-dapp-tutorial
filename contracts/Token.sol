//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.3;

import "hardhat/console.sol";

contract Token {
  string public name = "Brett Token";
  string public symbol = "BRT";
  uint public totalSupply = 1000000;
  address public owner;
  mapping(address => uint) balances;

    // mapping is like this in JS | const balances = { address: uint}

  constructor() {
    balances[msg.sender] = totalSupply;
    owner = msg.sender;
  }

  function transfer(address to, uint amount) external {
    require(balances[msg.sender] >= amount, "Not enough tokens");
    balances[msg.sender] -= amount;
    balances[to] += amount;
  }

  function balanceOf(address account) external view returns (uint) {
    return balances[account];
  }
}