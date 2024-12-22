// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// solidity 中的异常

//自定义error

//error TransferNotOwner();

//

error TransferNotOwner(address sender);

contract Errors {
    //一组映射,记录每个TokenId 的Owner
    mapping (uint256 => address) private  _owners;
      // 一组映射，记录每个TokenId的Owner
    //mapping(uint256 => address) private _owners;

//Error error必须搭配revert（回退）命令使用。 用来抛出异常
// 还可以在抛出异常的同时携带参数，帮助开发者更好地调试。类似自定义异常
//人们可以在contract之外定义异常。下面，我们定义一个TransferNotOwner异常，当用户不是代币owner的时候尝试转账，会抛出错误
    function transferOwner1(uint256 tokenId, address newOwner) public {
        if(_owners[tokenId] != msg.sender){
            revert TransferNotOwner(msg.sender);
        }
        _owners[tokenId]=newOwner;

    }

// Require
// require命令是solidity 0.8版本之前抛出异常的常用方法，目前很多主流合约仍然还在使用它。它很好用，唯一的缺点就是gas随着描述异常的字符串长度增加，比error命令要高。
//使用方法：require(检查条件，"异常的描述")
    function  transferOwner2(uint256 tokenId, address newOwner) public {
        require(_owners[tokenId]==msg.sender,"Transfer Not Ownet");
        _owners[tokenId]=newOwner;

    }
    //Assert
   // Assert
//assert命令一般用于程序员写程序debug，因为它不能解释抛出异常的原因（比require少个字符串）。
//它的用法很简单，assert(检查条件），当检查条件不成立的时候，就会抛出异常
   function  transferOwner3(uint256 tokenId, address newOwner) public{
     assert(_owners[tokenId] == msg.sender);
    _owners[tokenId] = newOwner;
   }

}