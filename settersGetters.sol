pragma solidity 0.7.5;

contract SettersGetters{
    int number;

    // Getter
    function getNumber() public view returns (int){
        return number;
    }

    // Setter
    function setNumber(int _number) public {
        number = _number;
    }
}