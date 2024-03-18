Stream<int> myStreamGeneratorFunction() async* {
  yield 1;
  await Future.delayed(Duration(milliseconds: 200));
  yield 2;
  await Future.delayed(Duration(milliseconds: 200));
  yield 3;
  await Future.delayed(Duration(milliseconds: 200));
}

void main() async {
  await for (var value in myStreamGeneratorFunction()) {
    print(value);
  }
}
