// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;
contract ValueTypes{
  //值类型 ：布尔型
    //布尔值的运算符包括 同java 
    // ! （逻辑非）
    // && （逻辑与，"and"）
   //|| （逻辑或，"or"）
   //== （等于）
     //!= （不等于）  
     //>= （大于等于）
    //<=  （小于等于）
       //>  （大于）
        //<  （小于）

  //布尔值的运算符包括
  // 布尔类型
  // bool public _bool=true;
  // bool public _bool1=!_bool; //取非 false
  // bool public _bool2=_bool&&_bool1 ;//与 false
  // bool public _bool3 = _bool || _bool1; // 或 true 有真为真
  // bool public _bool4 = _bool == _bool1; // 相等 false
  // bool public _bool5 = _bool != _bool1; // 不相等   true 

  //&& 和 || 运算符遵循短路规则，这意味着，假如存在 f(x) || g(y) 的表达式，如果 f(x) 是 true，g(y) 不会被计算，
  //即使它和 f(x) 的结果是相反的。假如存在f(x) && g(y) 的表达式，如果 f(x) 是 false，g(y) 不会被计算。 所谓“短路规则”，一般出现在逻辑与（&&）和逻辑或（||）中。 当逻辑与（&&）的第一个条件为false时，就不会再去判断第二个条件； 当逻辑或（||）的第一个条件为true时，就不会再去判断第二个条件，这就是短路规则。

 //值类型：整型
 int public _int =1;// 整型 带符号的整数
 uint public _uint=1; //正整数 不带符号
 
 uint256 public _number=2022222; //不带符号的正整数256位

 //值类型：整型运算符
 /**
  比较运算符（返回布尔值）： <=， <，==， !=， >=， >
算数运算符： +， -， *， /， %（取余），**（幂）
  */
 uint256 public _number1=_number+1;
 uint256 public _number2 = 2**2; // 指数
 uint256 public _number3 = 7 % 2; // 取余数
 bool public _numberbool = _number2 > _number3; // 比大小

 // 值类型：地址类型

//地址
address public _addres=0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;


  

 
}