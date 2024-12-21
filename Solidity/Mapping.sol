// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
// 映射类型
contract Mapping{
    //声明映射的格式为mapping(_KeyType => _ValueType)，
    //其中_KeyType和_ValueType分别是Key和Value的变量类型
    mapping(uint => address) public idToAddress; // id映射到地址
    mapping(address => address) public swapPair; // 币对的映射，地址到地址

     // 规则1. _KeyType不能是自定义的 下面这个例子会报错
    //我们定义一个结构体 Struct
    // struct Student{
    //    uint256 id;
    //    uint256 score; 
    // }
   // mapping(Struct => uint) public testVar;

   //给map新增键值对
   function writeMap(uint _key,address _Value) public  {
        idToAddress[_key] = _Value;
   }
   ///我们可以在 returns 中标明返回变量的名称 那么函数返回需要使用这个定义的变量名 如address a。Solidity 会初始化这些变量，并且自动返回这些函数的值，无需使用 return。
   // 我们可以在 returns 中没有标明返回变量的名称，需要手动返回
   function getFromMap(uint _key) public   view returns (address a){
     a= idToAddress[_key];
     
   }
   
// delete操作符
//delete操作符
//delete a会让变量a的值变为初始值。
bool public _bool2 = true; 
function d() external {
    delete _bool2; // delete 会让_bool2变为默认值，false
}

}