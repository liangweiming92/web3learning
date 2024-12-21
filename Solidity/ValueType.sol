// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract ValueTypes {
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
 //int public _int =1;// 整型 带符号的整数
 uint public _uint=0; //整数 不带符号
 
 //uint256 public _number=2022222; //不带符号的正整数256位

 //值类型：整型运算符
 /**
  比较运算符（返回布尔值）： <=， <，==， !=， >=， >
算数运算符： +， -， *， /， %（取余），**（幂）
  */
 //uint256 public _number1=_number+1;
// uint256 public _number2 = 2**2; // 指数
// uint256 public _number3 = 7 % 2; // 取余数
// bool public _numberbool = _number2 > _number3; // 比大小

 // 值类型：地址类型

//地址类型有两类
//1. 普通地址 存储一个 20 字节的值（以太坊地址的大小）
//address 
// address public _address=0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
// //2. payable address 
// //比普通地址多了transfer 和 send  两个成员方法，用于接收转账
// address payable   public _address1=payable (_address); //可以转账、查余额
//地址类型的成员
//uint256 public _balance=_address1.balance;

//bool public _send=_address1.send(10);

// 值类型：定长字节数组
//定长字节数组: 属于值类型，数组长度在声明之后不能改变。根据字节数组的长度分为 bytes1, bytes8, bytes32 等类型。定长字节数组最多存储 32 bytes 数据，即bytes32。
// 不定长字节数组: 属于引用类型，数组长度在声明之后可以改变，包括 bytes 等
//bytes32 public _byte32="ancndcddxxcdccd";
//bytes1 public _cc1=_byte32[0];
//bytes8 public _cc2=_byte32[0];

//值类型：枚举

//枚举（enum）是 Solidity 中用户定义的数据类型。它主要用于为 uint（从0开始用用字符串表示） 分配名称从0开始，使程序易于阅读和维护。它与 C 语言 中的 enum 类似，
//使用名称来代替从 0 开始的 uint：
// 用enum讲 uint 0,1,2 表示为 Buy, Hold, Sell
// enum ActionSet {Buy,Hold,Sell} //后面没有;

// ActionSet action = ActionSet.Hold;
// // enum可以和uint显式的转换
// function enumToUint() external view returns(uint){
//     return uint(action);
// }

  

 
}