// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Event{
    event Transfer(address indexed from, address indexed to, uint256 value);

    // 定义_balances映射变量，记录每个地址的持币数量
    mapping(address => uint256) public _balances;

    function _transfer(address from,address to,uint256 amount) external {

        //给map新增键值对
        _balances[from] = 10000000; // 给转账地址一些初始代币

        _balances[from] -=  amount; // from地址减去转账数量
        _balances[to] += amount; // to地址加上转账数量

        // 释放事件
        emit Transfer(from, to, amount);

    }

}