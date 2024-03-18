import "dart:math";

Iterable<int> calculatePrimes() sync* {
  yield 2;
  for (int i = 3; true; i++) {
    if (calculatePrimes()
        .takeWhile((prime) => prime <= sqrt(i))
        .every((prime) => i % prime != 0)) {
      yield i;
    }
  }
}

void main() {
  calculatePrimes().take(20).forEach(print);
}
