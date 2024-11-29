## Json

- 解析 json 字符串，使用 `jsonDecode` 方法
- 将对象转换为 json 字符串，使用 `jsonEncode` 方法

```dart
// 解析 json 字符串
var jsonString = '''
  [
    {"score": 40},
    {"score": 80}
  ]
''';
var scores = jsonDecode(jsonString);

// 将对象转换为json字符串
var scores = [
  {'score': 40},
  {'score': 80},
  {'score': 100, 'overtime': true, 'special_guest': null}
];
var jsonText = jsonEncode(scores);
```

## UTF-8

- `utf8.decode()` 方法将字节序列解码为字符串
- `utf8.encode()` 方法将字符串编码为字节序列

```dart
// 将字节序列解码为字符串
List<int> utf8Bytes = [
  0xc3, 0x8e, 0xc3, 0xb1, 0xc5, 0xa3, 0xc3, 0xa9,
  0x72, 0xc3, 0xb1, 0xc3, 0xa5, 0xc5, 0xa3, 0xc3,
  0xae, 0xc3, 0xb6, 0xc3, 0xb1, 0xc3, 0xa5, 0xc4,
  0xbc, 0xc3, 0xae, 0xc5, 0xbe, 0xc3, 0xa5, 0xc5,
  0xa3, 0xc3, 0xae, 0xe1, 0xbb, 0x9d, 0xc3, 0xb1
];
var funnyWord = utf8.decode(utf8Bytes);


var lines = utf8.decoder.bind(inputStream).transform(const LineSplitter());
try {
  await for (final line in lines) {
    print('Got ${line.length} characters from stream');
  }
  print('file is now closed');
} catch (e) {
  print(e);
}

// 将字符串编码为字节序列
Uint8List encoded = utf8.encod('hello,world');
```
