// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
//一个合约文件里面 两个合约
// 第一个合约
contract Reference{
    // 固定长度 Array
    uint[8] array1;
    bytes1[5] array2;
    address[100] array3;

    // 可变长度 Array 没有定义长度就是变长
    uint[] array4;
    bytes1[] array5;
    address[] array6;
    bytes array7;

    // 初始化可变长度 Array 长度是5
    uint[]  array8 = new uint[](5);
    bytes array9 = new bytes(9);
    
    //给可变长度数组赋值

    //  function initArray() external pure returns(uint[] memory c){
    //     //定义的时候[] 不赋值就是变长 可以初始化的时候定义长度 成为定长但是长度定义好之后不能修改长度 并且需要手动赋值
    //     uint[] memory x = new uint[](3);
    //     x[0] = 1;
    //     x[1] = 3;
    //     x[2] = 4;
    //     return x;
    //  }
    // function arrayPush() public returns(uint[] memory ){
    //     uint[2] memory a = [uint(1),2]; //定长数组  数组字面常数(Array Literals)是写作表达式形式的数组，用方括号包着来初始化array的一种方式，并且里面每一个元素的type是以第一个元素为准的
    //     array4 = a;
    //     array4.push(3);
    //     return array4;
    // }

    function arrayPush() public returns(uint[] memory){
        uint[2] memory a = [uint(1),2];
        array4 = a;
        //push 3个元素
        array4.push(3);
        array4.pop();
        return array4;
    }
        
}
//结构体 第二个合约
contract StructTypes{
   struct Student{
    uint256 id;
    uint256 score; 
   }
   Student student; // 初始一个student结构体不赋值 相当于状态变量

   //给结构体赋值
   // 1 在函数中创建一个storage的struct引用
   function initStudent() external {
      Student storage _student=student;
       _student.id = 11;
       _student.score = 100;
   }
     // 方法2:直接引用状态变量的struct
     function initStudent2() external {
        student.id = 1;
        student.score = 80;
     }
      // 方法3:构造函数式
    function initStudent3() external {
        student = Student(3, 90);
    }

     // 方法4:key value
    function initStudent4() external {
        student = Student({id:99,score:99});
    }
}

    


