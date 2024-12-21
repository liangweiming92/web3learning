// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Constant{
// constant变量必须在声明的时候初始化，之后不能改变 不要与变量初始值混淆 非constant变量可以直接声明但是不赋值(也就是可以不初始化会有默认值)初始化就是给变量赋值
uint256 constant CONSTANT_NUM=10;
string constant CONSTANT_STRING = "0xAA";
bytes constant CONSTANT_BYTES = "WTF";
address constant CONSTANT_ADDRESS = 0x0000000000000000000000000000000000000000;

// immutable变量可以在constructor里初始化，之后不能改变
uint256 public immutable IMMUTABLE_NUM = 9999999999;
address public immutable IMMUTABLE_ADDRESS= address(this);
uint256 public immutable IMMUTABLE_BLOCK=10;
uint256 public immutable IMMUTABLE_TEST=2;

// 利用constructor初始化immutable变量，因此可以利用 初始化就是赋值
constructor(){
    IMMUTABLE_ADDRESS = address(this);
    IMMUTABLE_NUM = 1118;
    IMMUTABLE_TEST = test();
}

function test() public pure returns(uint256 a){
    a = 9;
}
}


