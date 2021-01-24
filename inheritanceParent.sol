pragma solidity 0.7.5;

contract Parent {
    // Make owner available to child contracts
    address internal owner;

    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
    constructor(){
        owner = msg.sender;
    }
}