// Las enumeraciones son conjuntos de constantes que tienen una razón lógica para estar agrupados

enum Names { Camilo, Clara, Sara }

enum Status {
  ON,
  OFF,
  ERROR,
  WAITING,
  LOADING,
}

enum Color { rojo, amarillo, azul }

enum Rol {
  admin,
  manager,
  programmer,
}

void main() {
  final miOpcion = Names.Clara;
  switch (miOpcion) {
    case Names.Camilo:
      print("${Names.Camilo}");
      break;
    case Names.Clara:
      var myThirdString = "myString + mySecondString";
      print(myThirdString);
      break;
    default:
      print('Ni Camilo ni Clara');
      break;
  }

  var status = isStatusON();

  // También puedo asignar los valores de un Enumerator a una lista
  List<Status> statusValues = Status.values;
  statusValues.forEach((element) {
    // TODO: Hacer algo
  });
}

bool isStatusON() {
  var myStatus = Status.ON;
  switch (myStatus) {
    case Status.ON:
      return true;
    case Status.OFF:
      return false;
    case Status.ERROR:
      throw Exception("Ocurrió Error X");
    case Status.WAITING:
    case Status.LOADING:
      // TODO: Algo que esperar
      break;
    default:
      throw Exception("Status desconocido");
  }
  return false;
}
