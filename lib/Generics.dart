// Generics: Tipos de datos genéricos o más bien parametrizados
// Tipos que puedo crear y controlar

void main() {
  List<String> names = ["Camilo", "María Clara", "María Cecilia", "Eduardo"];
  /*
   al dar cmd + click en List sale: abstract class List<E> ...
   List<E> donde la E es el tipo genérico, permitiendo crear listas de cualquier tipo
   List <int>
   List <String>

   También permite la seguridad de tipos
   Lo siguiente sería error
  names.add(34);

  E, T, S, K, V
  element, type, key, value,

  Las clases genéricas sirve para operar con todos los tipos sin casarme con ninguno
  */

  Storage storageString = Storage("Hola");
  // Se puede anotar el tipo para cuando no se sepa el tipo de argumento
  // es una ayuda para el programador
  int userID = 14;
  Storage storageInt = Storage<int>(userID);

  bool showTutorial = true;
  var storageBool = Storage(showTutorial);
  // storageBool.value = "Hola"; causa error porque ya se aseguró el tipo a bool
  storageBool.value = false;

  // Llamando método
  var userIDresult = getUserID();
  print(userIDresult);

  print(cancelTutorial(23));
}

// Esta es una clase que funciona con cualesquier tipo
// Una clase que serviría para almacenar cualquier cosa en una DB
class Storage<T> {
  T value;

  Storage(this.value);
}

// método que recibe un elemento de cierto tipo y devolver de cierto tipo
V getUserID<V>() {
  var storage = Storage(123);
  return storage.value.toString() as V;
}

// También se puede asegurar que el método utilice el tipo que se está ingresando
cancelTutorial<E>(E cancel) {
  return Storage<E>(cancel);
}
