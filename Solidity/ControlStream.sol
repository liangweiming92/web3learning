// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract InsertionSort{
   //if else

   function ifElseTest(uint256 _numer) public  pure returns (bool a){
        if(_numer == 0){
            return(true);
        }else{
            return(false);
        }
   }

   // for loop
     function forLoopTest() public  pure  returns(uint256){
        uint256 sum=0;
        for(uint i = 0; i < 10; i++){
            sum += i;
        }
        return(sum);
     }

      // while
    function whileTest() public pure returns(uint256){
        uint sum = 0;
        uint i = 0;
        while(i < 10){
            sum += i;
            i++;
        }
        return(sum);
    }
  // do-while
    function doWhileTest() public pure returns(uint256){
        uint sum = 0;
        uint i = 0;
        do{
            sum += i;
            i++;
        }while(i < 10);
        return(sum);
    }
     // 三元运算符 ternary/conditional operator
    function ternaryTest(uint256 x, uint256 y) public pure returns(uint256){
        // return the max of x and y
        return x >= y ? x: y; 
    }


}