// First in, last out

class Stack {
  int size = 0;
  late List<int> elements = [];

  isEmpty() {
    return size == 0;
  }

  void push(int _element) {
    this.elements.insert(size++, _element);
  }

  int pop() {
    if (isEmpty()) {
      throwUnderFlowError();
    } else {
      // This is the wrong solution, it is not scalable.
      // isEmpty = true;
      // Then let's create a test that prove it! -> Push 2 Pop 1.
      // It's a forceful test -> you know it is the wrong solution!
      return elements.removeAt(--size);
    }
  }

  // Never tiene 3 utilidades. Entre ellas, es sólo lanzar un error.
  // La ventaja es que no obliga a las funciones que lo llaman a cambiar su tipo de retorno
  Never throwUnderFlowError() {
    throw RangeError("UnderFlow Error: can't pop an empty stack");
  }
}
