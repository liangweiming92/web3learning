// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Return {

      uint256 public _number2 = 5;

    // 返回多个变量
    function returnMultiple()
        public
        pure
        returns (
            uint256,
            bool,
            uint256[3] memory aa
        )
    {
        return (1, true, [uint256(1), 2, 3]);
    }

    //命名式返回
    //我们可以在 returns 中标明返回变量的名称。Solidity 会初始化这些变量，并且自动返回这些函数的值，无需使用 return。
    function returnNamed()
        public
        pure
        returns (
            uint256 _number,
            bool _bool,
            uint8[3] memory _array
        )
    {
        _number = _number + 1;
        _bool = false;
        _array = [3, 2, 1];
    }

    //  解构式赋值
    // Solidity 支持使用解构式赋值规则来读取函数的全部或部分返回值。

   // 读取返回值，解构式赋值 要声明变量
  
         // 读取返回值，解构式赋值
    function readReturn() public pure returns(bool a){
        //读取所有返回值：声明变量，然后将要赋值的变量用,隔开，按顺序排列。
        //uint256 _number1;
        //bool _bool;
        // a =false;
        //uint8[3] memory _array;
        //(_number1, _bool2, _array) = returnNamed();
        
        //读取部分返回值：声明要读取的返回值对应的变量，不读取的留空。在下面的代码中，我们只读取_bool，而不读取返回的_number和_array：

         (, a, ) = returnNamed();
    }



    

}
