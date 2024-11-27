void main() {
  var (a, b) = userInfo();
  print('name: $a, age: $b');
}

(String name, int age) userInfo() {
  return ('Tom', 20);
}
