pragma solidity >=0.4.22 <0.6.0;

contract HelloWorld {
    string name;

    constructor() public {
        name = "Bob";
    }

    function sayHello() public view returns (string memory) {
        return name;
    }

    function setName(string memory n) public {
        name = n;
    }
}