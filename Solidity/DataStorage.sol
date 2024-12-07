// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// calldata修饰的变量在内存上 但是不能修改
contract DataStorage{
//   function fCallData(uint[] calldata _x) public  pure returns (uint256[] calldata){
//           return (_x);
//   }

   uint[] private x=[1,2,3,4,5,6]; //状态变量 数组 x;


// 函数可见性不能少
//storage（合约的状态变量）赋值给本地storage（函数里的）时候，会创建引用，改变新变量会影响原变量
  function fStorage() public  {
    //声明一个storage的变量 xStorage，指向x。修改xStorage也会影响x 必须声明数据存储位置
    uint[] storage xStorage = x;
    xStorage[0] = 100;
  }


     function fMemory() public view returns(uint a){
        //声明一个Memory的变量xMemory，复制x。修改xMemory会影响x
        uint[] memory xMemory = x;
        xMemory[0] = 100;
        return xMemory[0];
        // xMemory[1] = 200;
        // uint[] memory xMemory2 = x;
        // xMemory2[0] = 300;
    }
}

contract Variables {

    uint public x = 1;
    uint public y;
    string public z;

//[pure|view|payable]：决定函数权限/功能的关键字 可以不写的
 function foo() public {
    // 可以在函数里更改状态变量的值
    x = 5;
    y = 2;
    z = "0xAA";
}

// zz1 类似形参 不一定和函数内定义的 变量名称一样
function bar() external pure returns(uint zz1){
    uint xx = 1;
    uint yy = 3;
    uint zz2 = xx + yy;
    return(zz2);
}

// 命名式返回 已经定义好了返回变量的名称 直接返回
function gloabl() external view returns (address a,uint b,bytes memory c){
    a = msg.sender;
    b = block.number;
      c = msg.data;
}

//wei: 1
// gwei: 1e9 = 1000000000
// ether: 1e18 = 1000000000000000000
function weiUnit() external pure returns(uint) {
    assert(1 wei == 1e0);
    assert(1 wei == 1);
    return 1 wei;
}



function gweiUnit() external pure returns(uint) {
    assert(1 gwei == 1e9);
    assert(1 gwei == 1000000000);
    return 1 gwei;
}

function etherUnit() external pure returns(uint) {
    assert(1 ether == 1e18);
    assert(1 ether == 1000000000000000000);
    return 1 ether;
}

}