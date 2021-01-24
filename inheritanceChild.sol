pragma solidity 0.7.5;

import "./inheritanceParent.sol";

interface ExternalInterface {
    function addTransaction(address _from, address _to, uint _amount) external payable;
}

contract Child is Parent {

    // Refer to external contract
    address externalAddress;
    ExternalInterface externalInstance = ExternalInterface(externalAddress);

    function withdraw(uint amount) public onlyOwner returns (uint){
        require(balance[msg.sender] >= amount);
        msg.sender.transfer(amount);
        return balance[msg.sender];
    }

    function transfer(address recipient, uint amount) public {
        // Require critical checks
        require(balance[msg.sender] >= amount, "Balance not sufficient!");
        require(msg.sender != recipient, "Transfer to same address!");

        _transfer(msg.sender, recipient, amount);

        // Assert balance transferred from sender to recipient
        uint previousSenderBalance = balance[msg.sender];

        // Send transaction details to external contract
        externalInstance.addTransaction{value: 1 ether}(msg.sender, recipient, amount);

        assert(balance[msg.sender] == previousSenderBalance - amount);

        // event logs and further checks
    }
}