// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24;

import "./Barter9Token.sol";

contract Barter9TokenSale {
    address payable admin;
    Barter9Token public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event Sell(address _buyer, uint256 _amount);

    constructor(Barter9Token _tokenContract, uint256 _tokenPrice) public {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }

    //multiply
    function multiply(uint256 x, uint256 y) internal pure returns (uint256 z) {
        require(y == 0 || (z = x * y) / y == x);
    }

    //Buy Tokens
    function buyTokens(uint256 _numberOfTokens) public payable {
        //Require that value is equal to tokens
        require(msg.value == multiply(_numberOfTokens, tokenPrice));

        //Require that the contract has enough tokens
        require(tokenContract.balanceOf(address(this)) >= _numberOfTokens);
        //Require that a transfer is successful

        require(tokenContract.transfer(msg.sender, _numberOfTokens));

        //Keep track of tokenSold
        tokensSold += _numberOfTokens;

        //Trigger Sell Event
        emit Sell(msg.sender, _numberOfTokens);
    }

    //Ending Token Barter9TokenSale
    function endSale() public {
        //Require admin
        require(msg.sender == admin);
        //transfer remaining tokens to admin
        require(tokenContract.transfer(admin, tokenContract.balanceOf(address(this))));
        //destroy contract
        selfdestruct(admin);
    }
}
