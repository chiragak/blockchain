// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.8;

contract SoscErc20 {
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    string public constant name = "SOSC Coin";
    string public constant symbol = "SOSC";
    uint8 public constant decimals = 18;

    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) approved;

    uint256 totalSupply_;

    constructor(uint256 total) {
        totalSupply_ = total;
        balances[msg.sender] = total;
    }

    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }

    function balanceOf(address tokenOwner) public view returns (uint256) {
        return balances[tokenOwner];
    }

    function transfer(address reciever,uint256 value) public returns (bool success) {
        require(value <= balances[msg.sender]);
        balances[reciever] += value;
        balances[msg.sender] -= value;
        emit Transfer(msg.sender, reciever, value);
        return true;
    }

}
