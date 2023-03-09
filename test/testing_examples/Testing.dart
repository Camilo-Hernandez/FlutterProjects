import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group(
      'My group of tests',
      () => {
            test('calculate 6*7', () {
              // GIVEN
              var a = 6;
              var b = 7;
              // WHEN

              //THEN
              expect(calculate(a, b), 42);
            }),
            test('String.split()', () {
              // GIVEN
              var string = 'casa,arbol,perro';
              // WHEN

              // THEN
              expect(string.split(','), equals(['casa', 'arbol', 'perro']));
            }),
          });
}

int calculate(var a, var b) {
  return a * b;
}
