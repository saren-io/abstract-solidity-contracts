pragma solidity 0.7.5;

contract Events {

    mapping(address => uint) balance;
    address owner;

    // Index can be used to search for events that happened previously
    // Maximum of 3 indexed parameters
    event balanceAdded(uint amount, address indexed recipient);

    constructor(){
        owner = msg.sender;
    }

    function addBalance(uint _toAdd) public returns (uint){
        balance[msg.sender] += _toAdd;
        emit balanceAdded(_toAdd, msg.sender);
        return balance[msg.sender];
    }

    function getBalance() public view returns (uint){
        return balance[msg.sender];
    }

    function transfer(address recipient, uint amount) public {
        // Require critical checks
        require(balance[msg.sender] >= amount, "Balance not sufficient!");
        require(msg.sender != recipient, "Transfer to same address!");

        _transfer(msg.sender, recipient, amount);

        // Assert balance transferred from sender to recipient
        uint previousSenderBalance = balance[msg.sender];

        assert(balance[msg.sender] == previousSenderBalance - amount);

        // event logs and further checks
    }

    // Split things that do one simple things into separate functions to benefit from clean code
    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;
    }
}