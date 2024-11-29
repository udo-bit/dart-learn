## core 库中常用 api

### 1. 打印输入

- print

```dart
print("hello,world");
```

### 2. 数字处理

- parse
- toString
- toStringAsFixed
- toStringAsPrecision

```dart
// 1. 解析字符串为数字
int a = int.parse("123");
double b = double.parse("123.456");
double c = num.parse("123.456");
// 2. 数字转字符串
int a = 100.123;
String b = a.toString();
String c = a.toStringAsFixed(2); // 保留两位小数
String d = a.toStringAsPrecision(2) // 保留两位有效数字
```

### 3. 字符串

#### 3.1 常用操作

```dart
// 判断包括子字符串
assert('Never odd or even'.contains('odd'));

// 判断是否以某种模式开头
assert('Never odd or even'.startsWith('Never'));

// Does a string end with another string?
assert('Never odd or even'.endsWith('even'));

// Find the location of a string inside a string.
assert('Never odd or even'.indexOf('odd') == 6);

// 提取子字符串，包括第一个位置，不包括后一个位置
assert('Never odd or even'.substring(6, 9) == 'odd');

// 以空格拆分字符串，得到一个数组
var parts = 'progressive web apps'.split(' ');

// 通过索引访问字符串某个字符
var N = 'Never odd or even'[0]

// 拆分所有字符形成数组
for (final char in 'hello'.split('')) {
  print(char);
}

// 转换大写
assert('web apps'.toUpperCase() == 'WEB APPS');

// 转换小写
assert('WEB APPS'.toLowerCase() == 'web apps');

// 去掉前后空格
" Hello ".trim()

// 判断字符串是否为空
"".isNotEmpty()
```

#### 3.2 构造字符串

- `writeAll(iterial,sep)` 可以指定分隔符
- `toString()` 生成字符串

```dart
var sb = StringBuffer();
sb
  ..write('Use a StringBuffer for ')
  ..writeAll(['efficient', 'string', 'creation'], ' ')
  ..write('.');

var fullString = sb.toString();

assert(fullString == 'Use a StringBuffer for efficient string creation.');
```

#### 3.3 正则表达式

```dart
// 创建正则表达式对象
var numbers = RegExp(r'\d+');
// 判断是否包含
assert(!allCharacters.contains(numbers));
// 替换
var exedOut = someDigits.replaceAll(numbers, 'XX');

// 也可以直接使用正则表达式对象
assert(numbers.hasMatch(someDigits));

for (final match in numbers.allMatches(someDigits)) {
  print(match.group(0)); // 15, then 20
}
```
