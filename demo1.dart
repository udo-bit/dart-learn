void main() {
  List<String?> row = ['user', null];
  switch (row) {
    case ['user', var name?]:
      print('Hello, $name!');
  }
}
