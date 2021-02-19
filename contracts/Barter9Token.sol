// SPDX-License-Identifier: MIT
pragma solidity >=0.4.20;

contract Barter9Token {
    //Constructor
    //Set the total number of tokens
    //Read the total number of tokens

    //Name
    string public name = "Barter9";
    string public symbol = "BTR9";
    string public standard = "Barter9 v1.0";

    uint256 public totalSupply;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;

    constructor(uint256 _initialSupply) public {
        balanceOf[msg.sender] = _initialSupply;

        totalSupply = _initialSupply;

        //allocate the initial supply
    }

    //Transfer
    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        //Exeption if account doesn't have enough
        require(balanceOf[msg.sender] >= _value);

        //Transfer the balance
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        //Return a boolean
        //Transfer event
        emit Transfer(msg.sender, _to, _value);

        return true;
    }
}
