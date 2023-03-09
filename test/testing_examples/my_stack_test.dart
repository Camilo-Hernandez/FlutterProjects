/*
1. You are not allowed to write any production code until your have first written a test that fails because the production code doesn't exist.
2. You are not allowed to write any more of a unit test than is sufficient to fail - and not compiling is failing.
3. You are not allowed to write any more production code than is sufficient to pass the one failing unit test.
4. Engage as few brain cells as possible, you will need them later. Keep it simple! (KISS) Don't do too much too fast.
5. Try to avoid the core (the golden behaviour) of the problem until it is unavoidable. Save the most important feature of as long as possible.
6. If you think some code you just wrote is a wrong solution... prove it! Put it to a test.
7. You are not allowed to make the production code more specific than the tests. The tests and the production code must move in opposite directions.
    Every new test you add makes the tests more specific, more constrained. Everything you do to the production code must make it more general.

Following these 3 rules, you would have a documentation that'll be the envy of the world.
It will be even more fun!
Writing something that fails and then making it pass is funnier that writing tests for a code you already know it works.
It makes the code decoupled, it's made testable.

Why testing something that you're sure it works? It's boring.
When you write tests after the code, it is not only boring but also often difficult,
because in that moment you realize that some things must decouple from each other.
More work is added to you and eventually you decide to not do it because it implies
to input more effort than what you expected. So you leave a hole in the Test Suite.
And everybody does it too.
So what it causes is that... when the Test Suite runs... it doesn't mean anything
because is incomplete. You can't have the absolute security that the code works
absolutely good when the tests pass, you can't trust it.

Remember, you want to have that button...

In pair programming, you can write code for a pair to test, and then invert the roles.
It makes it enjoyable.
 */
import 'package:HelloDart/testing_examples/my_stack.dart';
import 'package:test/test.dart';

void main() {
  late Stack stack;

  setUp(() {
    stack = Stack();
  });

  group(
      'Stack',
      () => {
            test('.isEmpty() is true after creating the stack', () {
              expect(stack.isEmpty(), equals(true));
            }),
            test('.isEmpty() is false after pushing 0', () {
              stack.push(0);
              expect(stack.isEmpty(), equals(false));
            }),
            test('.throwUnderFlowError throws RangeError', () {
              expect(stack.throwUnderFlowError, throwsRangeError);
            }),
            test('.pop() throws UnderFlow in an empty stack', () {
              // Dado que throwUnderFlowError es tipo Never, se pone empaquetado
              expect(() => stack.pop(), throwsA(isRangeError));
            }),
            test('after push 0 and a pop, stack will be empty', () {
              stack.push(0);
              stack.pop(); // first this will fail
              expect(stack.isEmpty(), equals(true));
            }),
            test('after two pushes and one pop, stack will not be empty', () {
              stack.push(0);
              stack.push(0);
              stack.pop();
              expect(stack.isEmpty(), equals(false));
            }),
            test('after pushing X will pop X, stack will be empty', () {
              stack.push(99);
              expect(stack.pop(), 99);
              stack.push(88);
              expect(stack.pop(), 88);
            }),
            test('after pushing X and Y will pop Y and X', () {
              stack.push(99);
              stack.push(88);
              expect(stack.pop(), 88);
              expect(stack.pop(), 99);
            }),
          });
}
