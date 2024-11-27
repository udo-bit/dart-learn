## 1. Records 定义

- 命名字段要用{}包裹,并放在位置字段的后面
- 命名字段的名称作为定义的一部分，不同命名字段名称的记录是不同的类型
- 位置字段也可以有名称，但是名称仅用于文档，对程序没有影响

```dart
// 基本定义
var record = (1,2,3,"a");
// 命名字段
(int,int,{String name,int age}) v;
v = (1,2,name:"a",age:10);
```

## 2. Records 访问

- 对于命名字段，可以通过名称访问，例如：`records.name`
- 对于位置字段，可以通过位置访问，例如：`records.$1`

## 3. Records 解构

```dart
(String name, int age) userInfo(Map<String, dynamic> json) {
  return (json['name'] as String, json['age'] as int);
}

final json = <String, dynamic>{
  'name': 'Dash',
  'age': 10,
  'color': 'blue',
};

// 位置参数解构
var (name, age) = userInfo(json);

// 命名参数解构
({String name, int age}) userInfo(Map<String, dynamic> json) {
  return (name: json['name'] as String, age: json['age'] as int);
}
final (:name, :age) = userInfo(json);
```

## 4. Records 其他

- Records 可以作为返回值返回多个数据
- Records 类型和值都相等时，才相等
