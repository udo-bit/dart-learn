## 1. 文件常规操作

- `readAsString()` 将文件读取为字符串
- `readAsLines()` 将文件按行读取为字符串列表
- `readAsBytes()` 将文件读取为字节列表

```dart
var config = File('config.txt');

// Put the whole file in a single string.
var stringContents = await config.readAsString();
print('The file is ${stringContents.length} characters long.');

// Put each line of the file into its own string.
var lines = await config.readAsLines();
print('The file is ${lines.length} lines long.');

var contents = await config.readAsBytes();
  print('The file is ${contents.length} bytes long.');
```

## 2. 文件流操作

```dart

// 将文件内容当作流来读取

var config = File('config.txt');
  Stream<List<int>> inputStream = config.openRead();

  var lines = utf8.decoder.bind(inputStream).transform(const LineSplitter());
  try {
    await for (final line in lines) {
      print('Got ${line.length} characters from stream');
    }
    print('file is now closed');
  } catch (e) {
    print(e);
}

// 文件流转换为utf8编码
var lines = utf8.decoder.bind(inputStream).transform(const LineSplitter());
  try {
    await for (final line in lines) {
      print('Got ${line.length} characters from stream');
    }
    print('file is now closed');
  } catch (e) {
    print(e);
  }

// 文件流写入
var logFile = File('log.txt');
var sink = logFile.openWrite();
sink.write('FILE ACCESSED ${DateTime.now()}\n');
await sink.flush();
await sink.close();

// 追加写入
var sink = logFile.openWrite(mode: FileMode.append);
```

## 3. 文件夹操作

```dart
// 遍历文件夹
var dir = Directory('tmp');

  try {
    var dirList = dir.list();
    await for (final FileSystemEntity f in dirList) {
      if (f is File) {
        print('Found file ${f.path}');
      } else if (f is Directory) {
        print('Found dir ${f.path}');
      }
    }
  } catch (e) {
    print(e.toString());
  }
```
