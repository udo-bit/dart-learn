void main() {
  void doSomething() {
    print('Do something');
  }

  doSomething();
}

class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}
