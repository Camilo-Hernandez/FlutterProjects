/*
1. You are not allowed to write any production code until your have first written a test that fails because the production code doesn't exist.
2. You are not allowed to write any more of a unit test than is sufficient to fail - and not compiling is failing.
3. You are not allowed to write any more production code than is sufficient to pass the one failing unit test.
4. Engage as few brain cells as possible because you will need them later -> Keep it simple! Don't do too much too fast.

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
              expect(stack.isEmpty(), true);
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
          });
}
