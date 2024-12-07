# Solidity中的变量类型
1. 值类型(Value Type)：包括布尔型，整数型等等，这类变量赋值时候直接传递数值。
2. 引用类型(Reference Type)：包括数组和结构体，这类变量占空间大，赋值时候直接传递地址（类似指针）。
3. 映射类型(Mapping Type): Solidity中存储键值对的数据结构，可以理解为哈希表

# 函数

function <function name>(<parameter types>) {internal|external|public|private} [pure|view|payable] [returns (<return types>)]
## 说明 方括号中的是可写可不 写的关键字
1. function:声明函数时的固定用法。要编写函数，就需要以 function 关键字开头。
2. <function name>：函数名。
3. (<parameter types>)：圆括号内写入函数的参数，即输入到函数的变量类型和名称。
4. {internal|external|public|private}:函数可见性说明符,共有4种。
### 注意
1. public: 内部和外部均可见。
2. private: 只能从本合约内部访问，继承的合约也不能使用。
3. external: 只能从合约外部访问（但内部可以通过 this.f() 来调用,f是函数名）
4. internal: 只能从合约内部访问，继承的合约可以用。
5. 注意:/**合约中定义的函数需要明确指定可见性**/，它们没有默认值。
6. 注意:public|private|internal 也可用于修饰状态变量。public变量会自动生成同名的getter函数，用于查询数值。未标明可见性类型的状态变量，默认为internal。
7. [pure|view|payable]：决定函数权限/功能的关键字。payable（可支付的）很好理解，带着它的函数，运行的时候可以给合约转入 ETH。
8. [returns ()]：函数返回的变量类型和名称

# 返回值：return 和 returns
Solidity 中与函数输出相关的有两个关键字：return和returns。它们的区别在于：

returns：跟在函数名后面，用于声明返回的变量类型及变量名。
return：用于函数主体中，返回指定的变量。