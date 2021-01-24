pragma solidity 0.7.5;

contract External {

    struct Transaction {
        address from;
        address to;
        uint amount;
        uint txId;
    }

    Transaction[] transactions;

    function addTransaction(address _from, address _to, uint _amount) external payable {
        transactions.push(Transaction(_from, _to, _amount, transactions.length));
    }

    function getTransaction(uint _index) public view returns (address, address, uint) {
        return (transactions[_index].from, transactions[_index].to, transactions[_index].amount);
    }

    function getBalance() public view returns (uint){
        return address(this).balance;
    }
}