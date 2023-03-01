void main(List <String> arguments) { // correr en la terminal: dart run Funciones.dart hola mundo

  print(arguments);

  String miCadena = funcionConArgumentosOpcionales("Camilo", 25,
      estatura: 50.3, esProgramador: true);
  print(miCadena);

  // función empaquetada
  var someFunction = funcionConArgumentosOpcionales;
  print(someFunction.call("Camilo", 33));
  auth("Camilo", "9q2w3e4r", funcionConArgumentosOpcionales);

  // funciones anónimas, lambdas o closures
  var list = ["naranja", 'azul', 'negro'];
  list.forEach((color) {
    print(color);
  });
  void Function(dynamic) printElements = (element) {
    print(element);
  };
  list.forEach(printElements);

}

String funcionConArgumentosOpcionales(String name, int edad,
    {bool esProgramador = false, double? estatura}) {
  String extraInfo;
  String esMayorMenor;

  if (esProgramador) {
    esMayorMenor = 'mayor';
  } else {
    esMayorMenor = 'menor';
  }
  extraInfo = ', eres $esMayorMenor de edad';
  if (estatura != null) {
    extraInfo += ' y tu estatura es $estatura';
  }

  return "Hola $name, tu edad es $edad" + extraInfo;
}

void auth(String user, String password, Function login) {
  print(login.call(
      user,
      int.parse(
        password[0],
      )));
}
