// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.9;

import "./Context.sol";
// import "hardhat/console.sol";
contract Ownable is Context {
  address private _owner;

  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
  constructor() {

    address msgSender = _msgSender();
    _owner = msgSender;
    emit OwnershipTransferred(address(0), msgSender);
  }
  function owner() public view returns (address) {
    return _owner;
  }
  modifier onlyOwner() {
    require(_owner == _msgSender(), "NOT_OWNER");
    _;
  }
  
  function transferOwnership(address newOwner) public onlyOwner {
    _transferOwnership(newOwner);
  }
  function _transferOwnership(address newOwner) internal {
    require(newOwner != address(0), "ZERO_ADDRESS");
    emit OwnershipTransferred(_owner, newOwner);
    _owner = newOwner;
  }
}
