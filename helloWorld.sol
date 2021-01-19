pragma solidity 0.7.5;

contract HelloWorld {

    function hello() public pure returns (string memory){
        return "Hello World!";
    }
}

// Always include memory after the data type
// Pure specifies that the function will not access any variable from outside the function