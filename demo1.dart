import 'dart:io';
import 'dart:isolate';

void main() async {
  String content = await Isolate.run(() => getFileContent());
  print(content);
}

String getFileContent() {
  File file = new File('./demo1.dart');
  return file.readAsStringSync();
}
