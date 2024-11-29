## 1. Future

- 使用`Future.wait`等待多个 Future 完成, `Future.wait`接受一个 Future 列表, 返回一个 Future, 当列表中所有的 Future 都完成时, 这个 Future 完成.
- 当不关注多个 Future 的返回结果是，使用 `wait[Future,...].wait()` 等待多个 Future 完成, `wait`接受一个 Future 列表, 返回一个 Future, 当列表中所有的 Future 都完成时, 这个 Future 完成.
- 当关注多个 Futrue 的返回结果时，使用 `wait(Future,...).wait()`

```dart
// Futrue.wait
Future<void> deleteLotsOfFiles() async =>  ...
Future<void> copyLotsOfFiles() async =>  ...
Future<void> checksumLotsOfOtherFiles() async =>  ...

await Future.wait([
  deleteLotsOfFiles(),
  copyLotsOfFiles(),
  checksumLotsOfOtherFiles(),
]);
print('Done with all the long steps!');

// wait[Future,...].wait()
Future<void> delete() async =>  ...
  Future<void> copy() async =>  ...
  Future<void> errorResult() async =>  ...

  try {
    // Wait for each future in a list, returns a list of futures:
    var results = await [delete(), copy(), errorResult()].wait;

    } on ParallelWaitError<List<bool?>, List<AsyncError?>> catch (e) {

    print(e.values[0]);    // Prints successful future
    print(e.values[1]);    // Prints successful future
    print(e.values[2]);    // Prints null when the result is an error

    print(e.errors[0]);    // Prints null when the result is successful
    print(e.errors[1]);    // Prints null when the result is successful
    print(e.errors[2]);    // Prints error
  }


// wait(Future,...).wait()
Future<int> delete() async =>  ...
  Future<String> copy() async =>  ...
  Future<bool> errorResult() async =>  ...

  try {
    // Wait for each future in a record, returns a record of futures:
    (int, String, bool) result = await (delete(), copy(), errorResult()).wait;

  } on ParallelWaitError<(int?, String?, bool?),
      (AsyncError?, AsyncError?, AsyncError?)> catch (e) {
    // ...
    }

  // Do something with the results:
  var deleteInt  = result.$1;
  var copyString = result.$2;
  var errorBool  = result.$3;
```

## 2. Stream

```dart
if (await FileSystemEntity.isDirectory(searchPath)) {
    final startingDir = Directory(searchPath);
    await for (final entity in startingDir.list()) {
      if (entity is File) {
        searchFile(entity, searchTerms);
      }
    }
  } else {
    searchFile(File(searchPath), searchTerms);
  }

// 使用 transform 对 Stream 数据进行转换
var lines = inputStream.transform(utf8.decoder).transform(const LineSplitter());

// 异常处理
var lines =
      inputStream.transform(utf8.decoder).transform(const LineSplitter());
  try {
    await for (final line in lines) {
      print('Got ${line.length} characters from stream');
    }
    print('file is now closed');
  } catch (e) {
    print(e);
  }
```
