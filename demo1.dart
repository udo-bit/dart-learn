void main() {
  var msg = say(
    device: 'phone',
    'Tom',
    'hello',
  );
  print(msg);
}

String say(String from, String msg, {String? device}) {
  return "hello $from say $msg by $device";
}
