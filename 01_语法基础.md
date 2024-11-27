## 1. 变量定义

- 非空变量在使用前必须初始化
- 可空变量在定义时会自动初始化为 null
- 对于可空变量可以使用!操作符来断言非空
- late 修饰的变量在第一次使用前必须初始化
  - 对于全局变量和类成员变量，dart 无法判断
- final 和 const 修饰的变量只能初始化一次
  - final 可以在运行时初始化
  - const 只能在编译时初始化
  - const 还可以修饰构造方法
  - final 可以修饰实例属性，const 不可以，但是可以用 static const 修饰类属性

```dart
// 定义变量
var name = "Bob";
// 定义动态变量
dynamic name = "Bob";
// 或者
Object name = "Bob";
// 定义可空变量
String? name = "Bob";
// 用late修饰的变量可以延迟初始化
late String name;
// 用fianl修饰的变量只能初始化一次
final String name = "Bob";
// 用const修饰的变量是编译时常量
const String name = "Bob";
// 用const修饰的变量必须是编译时常量
// bar 不可以修改，foo 可以修改
var foo = const [];
const bar = [];
```

## 2. 运算符号

### 2.1 常见运算符

| 运算符                    | 描述                         |
| ------------------------- | ---------------------------- |
| /                         | 除法                         |
| ~/                        | 取整                         |
| %                         | 取余                         |
| ??=                       | 只有当左侧变量为空时才会赋值 |
| as                        | 类型转换                     |
| is                        | 类型判断,匹配时返回 True     |
| is!                       | 类型判断,匹配时返回 False    |
| &&                        | 逻辑与                       |
| \|\|                      | 逻辑或                       |
| !                         | 逻辑非                       |
| condition ? expr1 : expr2 | 条件表达式                   |
| expr1 ?? expr2            | 空判断表达式                 |
| ..和..?                   | 级联运算符                   |
| ...和...?                 | 扩展运算符                   |
| ?[]                       | 空安全取值                   |
| ?.                        | 空安全调用                   |

### 2.2 级联运算符

- 使用级联运算符可以对同一个对象进行一系列操作，提高效率
- 当对象为空时，使用?..运算符会跳过后面的操作

```dart
var paint = Paint()
  ..color = Colors.black
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5.0;
// 等价于
var paint = Paint();
paint.color = Colors.black;
paint.strokeCap = StrokeCap.round;
paint.strokeWidth = 5.0;
// 对象可能为空
querySelector('#confirm') // Get an object.
  ?..text = 'Confirm' // Use its members.
  ..classes.add('important')
  ..onClick.listen((e) => window.alert('Confirmed!'))
  ..scrollIntoView();
```

## 3. 注释

| 注释类型 | 描述     |
| -------- | -------- |
| //       | 单行注释 |
| /\* \*/  | 多行注释 |
| ///      | 文档注释 |

```dart
/// A domesticated South American camelid (Lama glama).
///
/// Andean cultures have used llamas as meat and pack
/// animals since pre-Hispanic times.
///
/// Just like any other animal, llamas need to eat,
/// so don't forget to [feed] them some [Food].
class Llama {
  String? name;

  /// Feeds your llama [food].
  ///
  /// The typical llama eats one bale of hay per week.
  void feed(Food food) {
    // ...
  }

  /// Exercises your llama with an [activity] for
  /// [timeLimit] minutes.
  void exercise(Activity activity, int timeLimit) {
    // ...
  }
}
```

## 4. 注解

- 常用的注解包括：@Deprecated, @deprecated, @override, and @pragma
- @Deprecated 和 @deprecated 都可以用来标记过时的 API
- @override 用来标记重写的方法
- @pragma 用来标记编译时的提示信息

```dart
// 自定义注解
class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}

@Todo('Dash', 'Implement this function')
void doSomething() {
  print('Do something');
}

```

## 5. 引入依赖

- 引入 dart 本身内置依赖 `import 'dart:math';`, 前置 dart: 为内置依赖
- 引入包管理工具 pub 依赖 `import 'package:args/args.dart';`，前置 package: 为 pub 依赖
- 为依赖取别名 `import 'package:args/args.dart' as args;`
- 引入依赖的一部分 `import 'package:args/args.dart' show ArgParser;`
- 隐藏依赖的一部分 `import 'package:args/args.dart' hide ArgParser;`
- 懒加载依赖 `import 'package:args/args.dart' deferred as args;`

```dart
import 'package:greetings/hello.dart' deferred as hello;
Future<void> greet() async {
  await hello.loadLibrary();
  hello.printGreeting();
}
```
