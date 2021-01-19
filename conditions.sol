pragma solidity 0.7.5;

contract Conditions {

    // state variables
    string message = "Hello World!";
    string error;

    constructor(string memory _message){
        message = _message;
    }

    function hello() public view returns (string memory){
        // Most conditions like <= % >+ etc. that exist in javascript also exist in solidity
        if (msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4) {
            return message;
        } else {
            return "Error: Wrong Address";
        }
    }
}