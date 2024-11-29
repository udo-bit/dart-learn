import 'dart:io';
import 'dart:isolate';

void main() {
  var t1 = DateTime(2024, 11, 29);
  var t2 = DateTime(1991, 10, 25);
  var duration = t1.difference(t2);
  print(duration.inDays / 365);
}
