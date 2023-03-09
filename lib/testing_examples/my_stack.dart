// First in, last out

class Stack {
  bool _isEmpty = true;

  isEmpty() {
    return _isEmpty;
  }

  void push(int i) {
    _isEmpty = false;
  }

  int pop() {
    throwUnderFlowError();
  }

  // Never tiene 3 utilidades. Entre ellas, es sólo lanzar un error.
  // La ventaja es que no obliga a las funciones que lo llaman a cambiar su tipo de retorno
  Never throwUnderFlowError() {
    throw RangeError("UnderFlow Error: can't pop an empty stack");
  }
}
