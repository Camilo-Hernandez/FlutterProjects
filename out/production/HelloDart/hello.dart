import 'dart:collection';

void main(){
  print('hola Dart');

  // Esto es un comentario

  /*
  Esto es un comentario multilínea
   */

  String myString = "Mi cadena de texto";
  String mySecondString = 'Mi otra cadena de texto';

  int myIntVariable = 12;
  double myDoubleVariable = 14.22;

  bool myBooleanVariable = true;
  dynamic myDynamicVariable = "Variable dinámica";
  myDynamicVariable = 14;
  myDynamicVariable = 13.1564;

  myDynamicVariable = LinkedHashMap(); // búsqueda -> O(1). HashMap() -> O(n)
  myDynamicVariable[0] = ['Jack'];
  myDynamicVariable[132] = ['Robert'];
  myDynamicVariable[12] = ['Nickle'];
  print(myDynamicVariable.values);


  var myVariable = true; // por inferencia

  const myConstant = 'Mi constante'; // asignado en tiempo de compilación, debe conocerse el valor
  final myFinalConstant = myString; // asignado en tiempo de ejecución

  if (myVariable != false || !myVariable && myVariable){
  }
  else if (myString == 'Mi Cadena' || mySecondString.isEmpty){

  } else{

  }

  // Sound Null Safety
  var score = null;
  print(score);
  score = 13;
  print(score);
  score = "hol";
  print(score);
  String? myNullableVariable; // cuando se crea se le asigna el valor nulo
  print(myNullableVariable);
  myNullableVariable = 'Mi cadena de texto nulable'; // le asigno un valor diferente al nulo
  print(myNullableVariable);
  myNullableVariable = null; // vuelvo a asignarle el valor nulo
  print(myNullableVariable);

  List<int> myIntList = [1, 5, 10];
  myIntList.forEach((element) {print(element);
  });

  Map<String, int> myString2IntMap = {'Solo': 1, 'Duo': 2};
  myString2IntMap.forEach((key, value) {print("$key -> $value");
  });
  
  myFunc(){}
  final myName = myFunc2("Camilo");

  final miOpcion = Names.Camilo;
  switch (miOpcion){
    case Names.Camilo:
      print("${Names.Camilo}");
      break;
    case Names.Clara:
      var myThirdString = myString + mySecondString;
      print(myThirdString);
      break;
    default:
      print('Ni Camilo ni Clara');
      break;
  }

  Programmer meTheProgrammer = Programmer("Camilo", 17, "Kotlin & Flutter");
  meTheProgrammer.code();

}

void myFunc(){}
String myFunc2(String name){
  return name;
}

enum Names{
  Camilo, Clara, Sara
}

class Programmer{
  String name;
  int age;
  String language;

  Programmer(this.name, this.age, this.language);

  void code(){
    print("I'm Coding!");
  }
}