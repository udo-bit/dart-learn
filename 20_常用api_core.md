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

// 遍历匹配到的结果
for (final match in numbers.allMatches(someDigits)) {
  print(match.group(0)); // 15, then 20
}
```

### 4. List

```dart
// 创建空列表
var fruits = <String>[];
// 添加单个元素
fruits.add('apples');
// 添加多个元素
fruits.addAll(['oranges', 'kiwi']);
// 获取元素长度
assert(fruits.length == 3);
// 获取元素对应索引
var applesIndex = fruits.indexOf('apples');
// 移除元素
fruits.removeAt(applesIndex);
// 清空
fruits.clear();
// 判断是否为空
assert(fruits.isEmpty);
// 创建重复元素组成的列表
var list = List.filled(3, 'a');
// 使用 every 遍历元素,判断是否所有者都满足条件，返回 bool
assert(list.every((element) => element == 'a'));
// 排序
// sort 对应的函数参数必须返回一个数字，小于0表示从小到大排序，大于0表示从大到小排序，等于0表示维持原来的顺序
fruits.sort((a,b)=>a.compareTo(b));
```

### 5. Set

- set 是无序集合，因此不能通过索引来访问元素
- set 中的元素是唯一的

```dart
var sets = <String>{};
// 添加元素
sets.add('a');
// 添加多个元素
sets.addAll(['a','b','c'])
// 移除元素
sets.remove('a')
// 从List中创建Set
Set.from(['e','f','g'])
// 判断单个元素是否在set中
sets.contains('a')
// 判断多个元素是否都在set中
sets.containsAll(['a','b'])
// 获取多个set交集
var intersection = sets.intersection(otherSets)
```

### 6. Map

```dart
// 创建map
var peo = <String,String>{};
// 判断是否包括某个键
peo.containsKey(key)
// 移除某个键值对
peo.remove(key)
// 获取所有键(注意是属性，不是方法)
peo.keys
// 获取所有值
peo.values
// 只有在键不存在时才将键值对添加到map中
// 第二个参数必须时一个函数，返回要添加的值
peo.putIfAbsent(key,()=>somefunc());
```

### 7. 集合通用方法

```dart
var teas = ['green', 'black', 'chamomile', 'earl grey'];
// 使用forEach遍历集合元素
teas.forEach((tea)=>print(tea));
// 遍历map使用两个变量
aMap.forEach((k,v)=>print("$k-$v"));
// map方法处理每个元素
teas.map((tea)=>tea.toUpperCase());
// map返回一个可迭代对象,通过toList和toSet方法可以转换成集合
teas.map((tea)=>tea.toUpperCase()).toList();
// where筛选元素
teas.where((tea)=>isDecaff(tea))
// 判断是否存在满足条件的元素
teas.any(isDecaff)
// 判断是否所有元素都满足
teas.every(isDecaff)
```

### 8. URI

#### 8.1 encodeFull() 和 decodeFull()

- `encodeFull()` 将字符串转换为 URL 编码，不会对特殊字符进行编码，例如 `:`、`/`、`?`、`&`、`=` 等
- `decodeFull()` 将 URL 编码的字符串转换为原始字符串

```dart
var uri = 'https://example.org/api?foo=some message';

var encoded = Uri.encodeFull(uri);
assert(encoded == 'https://example.org/api?foo=some%20message');

var decoded = Uri.decodeFull(encoded);
assert(uri == decoded);
```

#### 8.2 encodeComponent() 和 decodeComponent()

- `encodeComponent()` 将字符串转换为 URL 编码，会对特殊字符进行编码
- `decodeComponent()` 将 URL 编码的字符串转换为原始字符串

```dart
var uri = 'https://example.org/api?foo=some message';

var encoded = Uri.encodeComponent(uri);
assert(
    encoded == 'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');

var decoded = Uri.decodeComponent(encoded);
assert(uri == decoded);
```

#### 8.3 解析 URI

- `Uri.parse()` 将字符串解析为 URI 对象

```dart
var uri = Uri.parse('https://example.org:8080/foo/bar#frag');

assert(uri.scheme == 'https');
assert(uri.host == 'example.org');
assert(uri.path == '/foo/bar');
assert(uri.fragment == 'frag');
assert(uri.origin == 'https://example.org:8080');
```

#### 8.4 构建 URI

- `Uri.https()` 创建一个使用 HTTPS 协议的 URI
- `Uri.http()` 创建一个使用 HTTP 协议的 URI

```dart
var uri = Uri(
    scheme: 'https',
    host: 'example.org',
    path: '/foo/bar',
    fragment: 'frag',
    queryParameters: {'lang': 'dart'});
assert(uri.toString() == 'https://example.org/foo/bar?lang=dart#frag');

var httpUri = Uri.http('example.org', '/foo/bar', {'lang': 'dart'});
var httpsUri = Uri.https('example.org', '/foo/bar', {'lang': 'dart'});
```

### 9. DateTime

```dart
// Get the current date and time.
var now = DateTime.now();

// Create a new DateTime with the local time zone.
var y2k = DateTime(2000); // January 1, 2000

// Specify the month and day.
y2k = DateTime(2000, 1, 2); // January 2, 2000

// Specify the date as a UTC time.
y2k = DateTime.utc(2000); // 1/1/2000, UTC

// Specify a date and time in ms since the Unix epoch.
y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);

// Parse an ISO 8601 date in the UTC time zone.
y2k = DateTime.parse('2000-01-01T00:00:00Z');

// Create a new DateTime from an existing one, adjusting just some properties:
var sameTimeLastYear = now.copyWith(year: now.year - 1);

// 获取日期时间的时间戳
var y2k = DateTime.utc(2000);
assert(y2k.millisecondsSinceEpoch == 946684800000);

// 创建时间间隔对象
// Add one year.
var y2001 = y2k.add(const Duration(days: 366));
assert(y2001.year == 2001);

// Subtract 30 days.
var december2000 = y2001.subtract(const Duration(days: 30));
assert(december2000.year == 2000);
assert(december2000.month == 12);

// 计算时间差
var duration = y2001.difference(y2k);
assert(duration.inDays == 366); // y2k was a leap year.
```
