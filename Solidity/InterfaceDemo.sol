// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


 //定义接口合约(不是普通合约 以interface 开头 +接口合约名称) 不需要声明 virtual
  interface Base {
     function getFirstName() external pure  returns(string memory);
    function getLastName() external pure returns(string memory);
  }

  //普通合约 继承后 实现方法可加可不加 override 因为肯定需要实现
   contract BaseImpl is Base{
    //必须实现抽象合约里面的方法 
     function getFirstName() external pure  override returns(string memory){
        return "Amazing";
    }
    function getLastName() external pure  override returns(string memory){
        return  "Ang";
    }
    
  }

  interface Name1 is  Base{
      
    }