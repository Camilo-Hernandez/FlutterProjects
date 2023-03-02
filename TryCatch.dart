// Exceptions
import 'dart:io';

void main(){
  try{
    var name = "Camilo";
    //name.substring(-1);
  }catch(e){
    print('El rango del substring no es el correcto');
  }

  var url = "http://imagenes/archivo1.png";
  try {
    print(downloadFileFrom(url));
  } on SocketException { // sin agarrar la excepción
    print("Internet caído.");
  } on IOException catch (e){ // aquí sí me interesa saber cuál fue el error
    print("Ocurrió el error al guardar el archivo");
    log(e);
    // Para todos, cuando no se sabe qué pasó
    // el stacktrace es el camino que recorrió para llegar a activar el error
  } on Exception catch (exception, stacktrace){
    print('Ocurrió un error desconocido');
    log(exception, stacktrace: stacktrace);
    // Finally se ejecuta al final sin importar si hubo excepción o no
    // util para hacer limpieza de código o tareas específicas al final del código
  } finally {
    cleanCache(url);
  }

  // Ejemplo con mi excepción personalizada
  var userID = 10;
  try {
    loginUser(userID);
  } on InvalidUserException catch (e, stacktrace){
    print(e.cause);
    log(e, stacktrace: stacktrace);
    print('\nLa app sigue corriendo');
  }

}

void loginUser(int userID) {
  // Hace algo de login
  throw InvalidUserException("Usuario bloqueado");
}

void cleanCache(String url) {
  print('Limpiando caché $url');
}

log (Exception exception, {StackTrace? stacktrace}){
  print('Enviar la excepción al server:\n   $exception');
  if (stacktrace != null) print('Enviar el stracktrace: $stacktrace');
}

String downloadFileFrom(String url){
  /*
  throw SocketException("Error de archivo");
  throw FileSystemException("Error de archivo");
  throw Exception();
  */
  return "This is the File from $url";
}

// Crear mis propias excepciones
class InvalidUserException implements Exception{
  String? cause;
  InvalidUserException([this.cause]);
}