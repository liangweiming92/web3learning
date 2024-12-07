// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract FunctionType {
    uint256 public number = 5;//公约的公共状态和变量

    // pure 关键字 不能修改合约变量和状态
    // view 关键字 只能看(读)不能修改合约的变量和状态
    //函数必须指定可见性 internal|external|public|private

    //普通函数可以读写
    function add() external   {
        number = number + 1;
    }

    
    // pure: 纯纯牛马
    function addPure(uint256 _number)
        external
        pure
        returns (uint256 new_number)
    {
        return new_number = _number + 1;
    }

    // view 可以读并且赋予另一个变量
    function addView() external view returns (uint256 new_number){
        new_number = number + 1;
    }
    
    // internal vs external

    //internal 内部函数
    
    // internal: 内部函数 智能合约内部使用 部署之后无法直接调用
   function minus() internal {
    number = number - 1;
   }

    //合约内的函数可以调用内部函数
//    function minsCall() public  view returns(uint256 balance) {
//     balance = address(this).balance;
//    }

   //payable
   // payable: 递钱，能给合约支付eth的函数

   function minusPayable() external payable returns(uint256 balance) {
    minus();    
    balance = address(this).balance;
}







}
