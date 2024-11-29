import 'dart:convert';
import 'dart:io';

void main() async {
  var filePath = "tmp.log";
  var file = File(filePath);
  var stream = file.openRead();
  var lines = stream.transform(utf8.decoder).transform(LineSplitter());
  await for (var line in lines) {
    print(line);
  }
}
