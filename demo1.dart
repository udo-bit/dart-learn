import 'dart:io';
import 'dart:isolate';

void main() {
  var str = "1 to 10";
  var numbers = RegExp(r"\d+");
  for (final match in numbers.allMatches(str)) {
    print(match.group(0));
  }
}
