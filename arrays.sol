pragma solidity 0.7.5;

contract Arrays {

    // State variables
    int[10] numbers;
    int[2] initialisedArray = [0, 1];
    int[] dynamicArray;

    function addNumberToDynamicArray(int _number) public {
        dynamicArray.push(_number);
    }

    function addNumberToFixedArray(int _number, uint index) public {
        numbers[index] = _number;
    }

    function getNumber(uint index) public view returns (int){
        return numbers[index];
    }

    function getDynamicArray() public view returns (int[] memory){
        return dynamicArray;
    }
}