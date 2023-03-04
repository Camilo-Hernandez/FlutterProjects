import 'dart:collection';

// late sirve para que no sea obligatorio inicializar una variable
// que sea muy costosa de crear

late List<Object> ListaDeJugadores;
List<Object> funcionMuyCostosaParaObtenerJugadores() {
  return [];
}

bool isAdmin() {
  return true;
}

void main() {
  // con late, la variable puede ser inicializada dentro un flujo alterno en un if cuando una condición se cumple
  if (isAdmin()) {
    ListaDeJugadores = funcionMuyCostosaParaObtenerJugadores();
  }

  print('hola Dart');

  // Esto es un comentario

  /*
  Esto es un comentario multilínea
   */
  /*
  Dividido en equipos, HITO 0
  Hacemos esto, hacemos esto, y lo otro
  Planeación y estrategia
  Ruta de aprendizaje haciendo proyectos
  Tener en cuenta las restricciones, los límites de uso
  Demás fechas:
      Desarrollo de proyectos
      He construido un proyecto haciendo uso de programación orientada a objetos avanzados
  */

  bool myBooleanVariable = true;

  // Tipos de datos numéricos
  int myIntVariable = 12;
  double myDoubleVariable = 14.22;
  // int y double heredan de num
  num myNum = 343;
  myNum = 13.4;

  // Cadenas de texto
  String myString = "Mi cadena de texto";
  String mySecondString = 'Mi otra cadena de texto con variable $myNum';

  // En Dart todos son tipo Object
  Object algo = "algo";
  algo = 13;
  algo = myBooleanVariable;

  // dynamic le digo que puede cambiar en tiempo de ejecución
  dynamic myDynamicVariable = "Variable dinámica";
  myDynamicVariable = 14;
  myDynamicVariable = 13.1564;

  myDynamicVariable = LinkedHashMap(); // búsqueda -> O(1). HashMap() -> O(n)
  myDynamicVariable[0] = ['Jack'];
  myDynamicVariable[132] = ['Robert'];
  myDynamicVariable[12] = ['Nickle'];
  print(myDynamicVariable.values);

  var myVariable = true; // por inferencia

  const myConstant =
      'Mi constante'; // asignado en tiempo de compilación, debe conocerse el valor
  final myFinalConstant = myString; // asignado en tiempo de ejecución

  // Listas
  var numbers = [1, 2, 3, 5];
  List<int> intList = [2, 22, 222, 2222];
  List<String> nombres = ["Julio", "Camilo", "Jorge"];
  List<double> doubleList = [3, 22.3, 35.2];
  List<num> nums = [2, 55, 23.35];
  List<Object> objects = [35, "Julia", true];

  var longitud = nums.length;
  nums.add(340);
  nums.remove(55);
  nums.removeAt(1);
  nums.isEmpty;
  nums.isNotEmpty;

  // Spread operator: ...
  var intList2 = [0, ...intList, 54];
  print("Segunda lista con spread operator: $intList2");

  // null aware spread operator: ...?
  var list3;
  var list4 = [0, ...?list3]; // se cae sin el signo de interrogración
  print(list4);

  // Dart permite lógicas dentro de la creación de listas
  var edad = 11;
  var menu = [
    'menu1',
    'menu2',
    if (edad > 18)
      'Sólo mayores de 18 años', // Si se satisface la condición, agrega la cadena de texto
  ];

  // Crear listas con órdenes en ciclos
  var menu2 = [for (var i in intList2) "menu de $i"];

  print(menu2);

  // Sets: listas de elementos no repetidos
  var dias = {"Lunes", "Martes", "Miércoles", "Domingo"};
  Set<String> meses = {"Enero", "Febrero", "Marzo", "Abril", "Abril"};
  meses.add("Agosto");
  print(meses);

  // Maps: listas de clave-valor
  var myMap = {12: "Menor", 18: "Mayor", 70: "Adulto mayor"};
  print(myMap);
  Map map2 = {"Entero": 1, "Double": 54.7, "Texto": "Es un texto", 14: 41};
  map2.addAll({"Espiritual": true});
  print(map2);
  Map mapaAgregado = {...myMap, ...map2};

  print(mapaAgregado);
  Map<String, int> myString2IntMap = {'Solo': 1, 'Duo': 2};
  myString2IntMap.forEach((key, value) {
    print("$key -> $value");
  });

  // Condicionales
  if (myVariable != false || !myVariable && myVariable) {
  } else if (myString == 'Mi Cadena' || mySecondString.isEmpty) {
  } else {}

  // Sound Null Safety
  var score = null;
  print(score);
  score = 13;
  print(score);
  score = "hol";
  print(score);

  String? myNullableVariable; // cuando se crea se le asigna el valor nulo
  print(myNullableVariable);
  myNullableVariable =
      'Mi cadena de texto nulable'; // le asigno un valor diferente al nulo
  print(myNullableVariable);
  myNullableVariable = null; // vuelvo a asignarle el valor nulo
  print(myNullableVariable);

  List<int> myIntList = [1, 5, 10];
  myIntList.forEach((element) {
    print(element);
  });

  myFunc() {}
  final myName = myFunc2("Camilo");

  Programmer meTheProgrammer = Programmer("Camilo", 17, "Kotlin & Flutter");
  meTheProgrammer.code();
}

void myFunc() {}

String myFunc2(String name) {
  return name;
}

class Programmer {
  String name;
  int age;
  String language;

  Programmer(this.name, this.age, this.language);

  void code() {
    print("I'm Coding!");
  }
}
