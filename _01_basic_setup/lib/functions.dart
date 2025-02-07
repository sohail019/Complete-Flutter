//

//* Positional Arguments(it is required) Function
void add(a, b) {
  print(a + b);
}

//* Named Arguments(it is optional) Function
void subtract({a, b}) {
  print(a - b);
}

//* Required Named Arguments Function
void multipy({required a, required b}) {
  print(a * b);
}

//* Optional Positional Arguments Function
void divide([a, b]) {
  print(a / b);
}

void main() {
  add(10, 20);
  subtract(a: 20, b: 10);
  multipy(a: 10, b: 20);
  divide(20, 10);
}
