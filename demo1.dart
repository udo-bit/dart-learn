void main() {
  (int, int, {String name, int age}) v1;
  v1 = (1, 2, name: "John", age: 30);
  print(v1.name);
  print(v1.$1);
}
