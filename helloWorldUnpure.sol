pragma solidity 0.7.5;

contract HelloWorldUnpure {

    string s1 = "Hello";

    function hello() public returns (string memory) {
        string memory s2 = " World!";
        return string(abi.encodePacked(s1, s2)); // Concatenate 2 strings together
    }
}
