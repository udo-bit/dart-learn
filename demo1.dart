void main() {
  print(Counter.c);
}

class Counter {
  static bool compate(int a, int b) {
    return a > b;
  }

  static int a = 1;
  static int b = 2;
  static bool c = compate(a, b);
}
