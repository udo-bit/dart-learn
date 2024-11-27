void main() {
  Animal cat = Cat("name", 1, 'orange');
  print(cat.color); // orange
}

class Animal {
  final String name;
  final int age;
  final String color;

  Animal(this.name, this.age, this.color);
}

class Cat extends Animal {
  final String color;

  Cat(String name, int age, this.color) : super(name, age, color);
}
