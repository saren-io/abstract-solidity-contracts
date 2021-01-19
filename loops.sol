pragma solidity 0.7.5;

contract Loops {
    function count(int number) public pure returns (int){
        int i = 0;

        // While loop
        while (i < 10) {
            number++;
            i++;
        }

        // For loop
        for (int i = 0; i < 10; i++) {
            number++;
        }
        return number;
    }
}