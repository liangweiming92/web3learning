// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

//定义抽象合约 以( abstract contract 开头定义抽象合约 +合约名称 ) 必须声明 virtual
abstract contract Base{
    string public name="base";
    // string 必须定义数据位置
    function getAlias() public pure virtual  returns(string memory a);
}

contract BaseImpl is Base{
    function getAlias() public pure override returns(string memory a){
        a="sss";
    }
}