pragma solidity 0.7.5;

contract PrivateFunction {

    mapping(address => uint) balance;

    function addBalance(uint _toAdd) public returns (uint){
        balance[msg.sender] += _toAdd;
        return balance[msg.sender];
    }

    function getBalance() public view returns (uint){
        return balance[msg.sender];
    }

    function transfer(address recipient, uint amount) public {
        // check balance of msg.sender

        _transfer(msg.sender, recipient, amount);

        // event logs and further checks
    }

    // Split things that do one simple things into separate functions to benefit from clean code
    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;
    }
}