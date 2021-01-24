pragma solidity 0.7.5;

import "./inheritanceParent.sol";

contract Destroyable is Parent {
    function destroy() public onlyOwner {
        address payable receiver = msg.sender;
        selfdestruct(receiver);
    }
}