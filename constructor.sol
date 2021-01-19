pragma solidity 0.7.5;

contract Constructor {
    // state variables
    string message;

    constructor(string memory _message){
        message = _message;
    }

    function hello() public returns (string memory){
        return message;
    }

}