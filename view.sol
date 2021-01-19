pragma solidity 0.7.5;

contract View {
    // State variables
    string message = "Hello World!";

    // Only 2 types of functions in solidity: pure and view
    // A view function can read state variables but is not allowed to change
    function hello() public view returns (string memory){
        return message;
    }
}