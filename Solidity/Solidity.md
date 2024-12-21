# Solidity中的变量类型
1. 值类型(Value Type)：包括布尔型，整数型 地址类型，枚举 enum，定长字节数组，这类变量赋值时候直接传递数值。
2. 引用类型(Reference Type)：包括数组和结构体，这类变量占空间大，赋值时候直接传递地址（类似指针）。
3. 映射类型(Mapping Type): Solidity中存储键值对的数据结构，可以理解为哈希表

# 函数

1. function <function name>(<parameter types>) {internal|external|public|private} [pure|view|payable] [returns (<return types>)]

# 返回值：return 和 returns
Solidity 中与函数输出相关的有两个关键字：return和returns。它们的区别在于：

returns:跟在函数名后面，用于声明返回的变量类型及变量名。
return:用于函数主体中，返回指定的变量。

# Solidity中的引用类型
引用类型(Reference Type):
定义数组（array）和结构体（struct），由于这类变量比较复杂，占用存储空间大，
必须要声明**数据存储**的位置。数组和结构体必须声明数据存储位置(3类)
## 数据位置
1. solidity 的数据存储位置有3类 storage,memory 和calldata,不同存储位置的gas成本不同。
storage类型的数据存在链上，类似计算机的硬盘，消耗gas多；memory和calldata类型的临时存在内存里，消费的gas少。

2. storage：合约里的状态变量默认都是storage，存储在链上。
3. memory：函数里的参数和临时变量一般用memory，存储在内存中，不上链。尤其是如果返回**数据类型是变长**的情况下，必须加memory修饰，例如：string, bytes, array和自定义结构。

calldata：和memory类似，存储在内存中，不上链。与memory的不同点在于**calldata变量不能修改**（immutable），一般用于函数的参数

## 数据位置和赋值规则

1. 在不同存储类型相互赋值时候，有时会产生独立的副本（修改新变量不会影响原变量），有时会产生引用（修改新变量会影响原变量）。

2. 赋值本质上是创建引用指向本体，因此修改本体或者是引用，变化可以被同步。

3. storage（合约的状态变量）赋值给本地storage（函数里的）时候，会创建引用，改变新变量会影响原变量
4. memory赋值给memory，会创建引用，改变新变量会影响原变量
5. 其他情况下，赋值创建的是本体的副本，即对二者之一的修改，并不会同步到另一方

## 变量的作用域
1. Solidity中变量按作用域划分有三种，
2. 分别是状态变量（state variable），局部变量（local variable）和全局变量(global variable)；

## 状态变量
1. 状态变量是数据存储在链上的变量，所有合约内函数都可以访问，gas消耗高。**状态变量在合约内、函数外声明**
## 局部变量
2. 局部变量是仅在函数执行过程中有效的变量，函数退出后，变量无效。局部变量的数据存储在内存里，不上链，gas低
## 全局变量
1. 全局变量是全局范围工作的变量，都是solidity预留关键字。**他们可以在函数内不声明直接使用**
2. 全局变量-以太单位与时间单位
Solidity中不存在小数点，以0代替为小数点，来确保交易的精确度，并且防止精度的损失，利用以太单位可以避免误算的问题，方便程序员在合约中处理货币交易
wei: 1
gwei: 1e9 = 1000000000
ether: 1e18 = 1000000000000000000
## 时间单位
可以在合约中规定一个操作必须在一周内完成，或者某个事件在一个月后发生。这样就能让合约的执行可以更加精确，不会因为技术上的误差而影响合约的结果。因此，时间单位在Solidity中是一个重要的概念，有助于提高合约的可读性和可维护性
seconds: 1
minutes: 60 seconds = 60
hours: 60 minutes = 3600
days: 24 hours = 86400
weeks: 7 days = 604800

## 引用类型
### 数组（array）和结构体（struct）

1. 固定长度数组：在声明时指定数组的长度。用T[k]的格式声明，其中T是元素的类型，k是长度
2. 可变长度数组（动态数组）：在声明时不指定数组的长度。用T[]的格式声明，其中T是元素的类型
3. 对于memory修饰的动态数组，可以用new操作符来创建，但是必须声明长度，并且声明后长度不能改变一般定义在函数里，
4. 数组字面常数(Array Literals)是写作表达式形式的数组，用方括号包着来初始化array的一种方式，并且里面每一个元素的type是以第一个元素为准的，

## 数组成员
length: 数组有一个包含元素数量的length成员，memory数组的长度在创建后是固定的。
push(): 动态数组拥有push()成员，可以在数组最后添加一个0元素，并返回该元素的引用。
push(x): 动态数组拥有push(x)成员，可以在数组最后添加一个x元素。
pop(): 动态数组拥有pop()成员，可以移除数组最后一个元素。

## 结构体 struct
1. Solidity支持通过构造结构体的形式定义新的类型。结构体中的元素可以是原始类型，也可以

## 映射类型
声明映射的格式为mapping(_KeyType => _ValueType)，其中_KeyType和_ValueType分别是Key和Value的变量类型

映射的规则
1. 规则1：映射的_KeyType只能选择Solidity内置的值类型，比如uint，address等，
不能用自定义的结构体。而_ValueType可以使用自定义的类型
2. 映射的存储位置必须是storage，因此可以用于合约的状态变量，函数中的storage变量和library函数的参数（见例子）。不能用于public函数的参数或返回结果中，因为mapping记录的是一种关系 (key - value pair)。

3. 如果映射声明为public，那么Solidity会自动给你创建一个getter函数，可以通过Key来查询对应的Value。

4. 给映射新增的键值对的语法为_Var[_Key] = _Value，其中_Var是映射变量名，_Key和_Value对应新增的键值对

## 变量初始值
1. 在Solidity中，声明但没赋值的变量都有它的初始值或默认值
### 值类型
boolean: false
string: ""
int: 0
uint: 0
enum: 枚举中的第一个元素
address: 0x0000000000000000000000000000000000000000 (或 address(0))
function
internal: 空白函数
external: 空白函数
### 引用类型
映射mapping: 所有元素都为其默认值的mapping
结构体struct: 所有成员设为其默认值的结构体
数组array
动态数组: []
静态数组（定长）: 所有成员设为其默认值的静态数组

### 常数 constant和immutable
1. constant（常量）和immutable（不变量）。状态变量声明这两个关键字之后，不能在初始化(初始化就是给变量赋值给个定义的值不是声明)后更改数值。这样做的好处是提升合约的安全性并节省gas。

2. 只有数值变量可以声明constant和immutable；string和bytes可以声明为constant，但不能为immutable

3. constant
   constant变量必须在声明的时候初始化，之后再也不能改变。尝试改变的话，编译不通过
### 构造函数和修饰器

1. 构造函数（constructor）是一种特殊的函数，每个合约可以定义一个，并在部署合约的时候自动运行一次。它可以用来初始化合约的一些参数
2. 修饰器
修饰器（modifier）是Solidity特有的语法，类似于面向对象编程中的装饰器（decorator），声明函数拥有的特性，并减少代码冗余 modifier的主要使用场景是运行函数前的检查，例如地址，变量，余额

### 事件
1. Solidity中的事件（event）是EVM上日志的抽象，它具有两个特点：

响应：应用程序（ethers.js）可以通过RPC接口订阅和监听这些事件，并在前端做响应。
经济：事件是EVM上比较经济的存储数据的方式，每个大概消耗2,000 gas；相比之下，链上存储一个新变量至少需要20,000 gas

声明事件
事件的声明由event关键字开头，接着是事件名称，括号里面写好事件需要记录的变量类型和变量名-

EVM日志 Log
以太坊虚拟机（EVM）用日志Log来存储Solidity事件，每条日志记录都包含主题topics和数据data两部分。

# 继承
Solidity中的继承（inheritance），包括简单继承，多重继承，以及修饰器（Modifier）和构造函数（Constructor）的继承-

规则
1. virtual: 父合约中的函数，如果希望子合约重写，需要加上virtual关键字。
2. override：子合约重写了父合约中的函数，需要加上override关键字。


## 多重继承
Solidity的合约可以继承多个合约。规则：

继承时要按辈分最高到最低的顺序排。比如我们写一个Erzi合约，继承Yeye合约和Baba合约，那么就要写成contract Erzi is Yeye, Baba，而不能写成contract Erzi is Baba, Yeye，不然就会报错。

如果某一个函数在多个继承的合约里都存在，比如例子中的hip()和pop()，在子合约里必须重写，不然会报错。

重写在多个父合约中都重名的函数时，override关键字后面要加上所有父合约名字，例如override(Yeye, Baba)；

## 修饰器的继承
Solidity中的修饰器（Modifier）同样可以继承，用法与函数继承类似，在相应的地方加virtual和override关键字即可。
## 构造函数的继承
1. 在继承时声明父构造函数的参数，例如：contract B is A(1)
2. 在子合约的构造函数中声明构造函数的参数，例如：、
3. 调用父合约的函数
1. 子合约有两种方式调用父合约的函数，直接调用和利用super关键字。直接调用：子合约可以直接用父合约名.函数名()的方式来调用父合约函数
2. super关键字：子合约可以利用super.函数名()来调用最近的父合约函数。Solidity继承关系按声明时从右到左的顺序是：contract Erzi is Yeye, Baba，那么Baba是最近的父合约

## 钻石继承
1. 在面向对象编程中，钻石继承（菱形继承）指一个派生类同时有两个或两个以上的基类。

2. 在多重+菱形继承链条上使用super关键字时，需要注意的是使用super会调用继承链条上的每一个合约的相关函数，而不是只调用最近的父合约。

