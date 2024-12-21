// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// 修饰器
contract Modifier{
    address public owner; // 定义(声明)owner变量 不是赋值初始化

    //构造函数
    constructor(address initOwner){
        owner = initOwner; // 在部署合约的时候，将owner设置为传入的initialOwner地址(即初始化就是赋值)
    }
    
    // 定义modifier 这个修饰器叫做 onlyOwner 类似定义一系列规则 只有符合这些个规则的函数(符合修饰器规则)才能被正常调用
    modifier onlyOwner(){
        require(msg.sender==owner);
        _;//如果是的话，继续运行函数主体；否则报错并revert交易
    }
     //带有onlyOwner修饰符的函数只能被owner地址调用
    function changeOwner(address _newOwner) external onlyOwner{
          owner = _newOwner; // 只有owner地址运行这个函数，并改变owner
    }
    // 0x38cB7800C3Fddb8dda074C1c650A155154924C73
    // 0x38cB7800C3Fddb8dda074C1c650A155154924C74

}