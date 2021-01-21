pragma solidity 0.7.5;

contract Withdraw {

    mapping(address => uint) balance;
    address owner;

    // Index can be used to search for events that happened previously
    // Maximum of 3 indexed parameters
    event balanceAdded(uint amount, address indexed recipient);

    constructor(){
        owner = msg.sender;
    }

    function deposit() public payable returns (uint) {
        balance[msg.sender] += msg.value;
        emit balanceAdded(msg.value, msg.sender);
        return balance[msg.sender];
    }

    function withdraw(uint amount) public returns (uint){
        // Can be withdrawn to any address
        // address payable toSend =  0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
        require(balance[msg.sender] >= amount, "Balance not sufficient!");
        balance[msg.sender] -= amount;
        msg.sender.transfer(amount);
        return amount;
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