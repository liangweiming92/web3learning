// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

//合约继承
contract Yeye {
  
     event Log(string msg);

    // 定义3个function: hip(), pop(), yeye()，Log值为Yeye。
    function hip() public virtual{
        emit Log("Yeye");
    }

    function pop() public virtual{
        emit Log("Yeye");
    }

    function yeye() public virtual {
        emit Log("Yeye");
    }


}

// 继承 is 相当于extends 
contract baba is Yeye{
     // 继承两个function: hip()和pop()，输出改为Baba。 使用override关键字
    function hip() public virtual override{
        emit Log("Baba");
    }

     function pop() public virtual override{
        emit Log("Baba");
    }

    
   //函数名称不能定义的和合约一样
    function baba1() public virtual{
        emit Log("Baba");
    }

    
}

// 多重继承  按照辈分由高到低
    contract ERZI is Yeye,baba{
      

       // 继承两个function: hip()和pop()，输出值为Erzi。如果某一个函数在多个继承的合约里都存在,在子合约里必须重写
    function hip() public virtual override(Yeye, baba){
        emit Log("Erzi");
    }
    // 重写在多个父合约中都重名的函数时，override关键字后面要加上所有父合约名字
    function pop() public virtual override(Yeye, baba) {
        emit Log("Erzi");
    }
    //调用父合约
    // 直接调用：子合约可以直接用父合约名.函数名()的方式来调用父合约函数
    function callParentSuper() public {
        Yeye.pop();
    }

     function callParentSuper2() public{
    // 将调用最近的父合约函数，Baba.pop()
    super.pop();
}
        
    }

    //修饰器
    contract Base1{
        //virtual 代表可以被子合约重写 声明一个修饰器
        modifier exactDividedBy2And3(uint _a) virtual {
        require(_a % 2 == 0 && _a % 3 == 0);
        _;
    }
    }
    contract Identifier is Base1 {
        // //计算一个数分别被2除和被3除的值，但是传入的参数必须是2和3的倍数
        function getExactDividedBy2And3(uint a) public exactDividedBy2And3(a) pure returns(uint, uint){
            // 返回如果没有定义变量名 需要定义return 返回 如果定义了不需要写return 
            // 修饰符放到哪个函数 就相当于把那个函数体里的内容复制到_；这个位置执行
            //explicit;
          return getExactDividedBy2And3WithoutModifier(a);
        }

        // function getExactDividedBy2And3(uint _dividend) public exactDividedBy2And3(_dividend) pure returns(uint, uint) {
        // return getExactDividedBy2And3WithoutModifier(_dividend);
   // }

      //计算一个数分别被2除和被3除的值
  
         //计算一个数分别被2除和被3除的值
    function getExactDividedBy2And3WithoutModifier(uint _dividend) public pure returns(uint, uint){
        uint div2 = _dividend / 2;
        uint div3 = _dividend / 3;
        return (div2, div3);
    }

    // 直接使用或者重新父合约的 修饰器
    modifier exactDividedBy2And3(uint _a) override {
    require(_a % 2 == 0 && _a % 3 == 0);
     _;
       }    
    }

    //构造函数的继承
    abstract contract A {
        uint public  a;
       constructor(uint _a){
        a=_a;
       }
    }

    // 在继承时声明父构造函数的参数
    contract B is A(1){

    }
    //在子合约的构造函数中声明构造函数的参数
    contract C is A{
        constructor(uint _a)A(_a){

        }
    }


