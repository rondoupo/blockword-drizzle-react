pragma solidity ^0.5.0;

contract MyStringStore {
  string public myString = "This 'Hello World' string is found in MyStringStore.sol";

  function set(string memory x) public {
    myString = x;
  }
}