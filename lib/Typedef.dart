// ponerle nombre a los tipos. Disponible a partir de Dart 2.13
// Para ponerle nombres a los tipos largos o de común conocimiento

typedef IntList = List<int>;
typedef ConfigurationMap = Map <int, List<Map<String, String>>>;

// Definir un tipo función
typedef MyCustomFuction = bool Function(String a, int b);

bool isUserInDB(String userName, int userID){
  // alguna lógica aquí
  return true;
}

// Para luego usarla en una de orden superior
otherFunctionHere(MyCustomFuction function, int x){
  function.call("Clara", 80);
}

void main(){
  MyCustomFuction verifyUserExistenceInDB = isUserInDB;
  var result = verifyUserExistenceInDB('Camilo', 10);


}