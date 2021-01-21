pragma solidity 0.7.5;

contract DataLocation {

    // Three different locations

    // Storage (state variables)
    // Will be stored forever (persistent data)
    uint data = 0;

    // Memory
    // Temporary data (will be stored for as long as the function runs)
    // Memory does not need to be specified for value data types like bytes, integers, booleans, addresses, fixed size arrays etc.

    // Call data
    // Similar to memory but read only
    // Needs to be declared like memory

    function getString(string memory text, string calldata test) public pure returns (string memory){
        return text;
    }
}