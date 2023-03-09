import 'package:test/test.dart';

void main() {
  group('MyClass', () {
    late MyClass myClass;

    setUp(() {
      myClass = MyClass();
    });

    test('should throw a CustomException when calling throwError', () {
      expect(
          () => myClass.throwError(), throwsA(TypeMatcher<CustomException>()));
    });
  });

  test('should throw ArgumentError', () {
    expect(throwError, throwsA(isA<ArgumentError>()));
    expect(throwError, throwsA(isArgumentError));
    expect(throwError, throwsA(predicate((x) => x is ArgumentError)));
  });
}

Never throwError() {
  throw ArgumentError.value(0);
}

class MyClass {
  void throwError() {
    throw CustomException('This is a custom exception.');
  }
}

class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  @override
  String toString() => message;
}
