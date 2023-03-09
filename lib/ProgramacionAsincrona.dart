/* La programación asíncrona es poner a ejecutar tareas de larga duración sin parar otros procesos.
 Utilizado más para:
 Consultar datos en internet: consultar un endpoint
 Escribir a una base de datos: aunque fueran milisegundos son alcanzados a ser percibidos por el usuario pues bloquea la interfaz
 Leer/escribir datos de un archivo en disco

Operación síncrona: bloquea otras operaciones hasta que se completa

Función síncrona: función que sólo ejecuta operaciones síncronas

Operación asíncrona: una vez iniciada, permite que otras operaciones se completen antes que ella

Función asíncrona: que ejecuta al menos 1 operación asíncrona, puede ejecutar síncronas

// Future class:
  Clase que representa el resultado de una operación asíncrona. Puede tener dos estados: completa / incompleta
  Así se crea: abstract class Future<T>
  -> Incompleta:
        Al llamarse, la función asíncrona devuelve un future incompleto esperando marcarse como completo o con error
  -> Completa:
        Si la operación asíncrona es exitosa, el future se completa con un valor o se completa con error si no.

// async keyword declara que dentro de la función pondremos tares que demoran mucho
// await keyword pone a esperar el resultado de la función u operación
*/

void main() async {
  // await produce que se tenga que esperar a que el resultado se obtenga para seguir con las siguientes tareas cuando la función tiene return
  var userName2 = await getUserName();
  print(userName2);

  await voidShowUserData(); // await no detiene la ejecución del programa cuando no se establece un return en la función
  print('Obteniendo información del usuario...');

  var userNameFuture = getUserName2();
  print(
      userNameFuture); // sólo así no funciona correctamente pues se muestra con estado Incompleto de forma síncrona
  userNameFuture.then((value) => print(
      value)); // sin el async funciona, permite que se ejecuten otras tareas paralelamente

  print('Final del programa');
}

Future<String> getUserName() {
  // Llama al server y toma mucho tiempo
  const tiempo = 5;
  return Future.delayed(const Duration(seconds: tiempo), () => "getUserName $tiempo s");
}

Future<String> getUserName2() {
  // Llama al server y toma mucho tiempo
  const tiempo = 5;
  return Future.delayed(const Duration(seconds: tiempo), () => "getUserName2 $tiempo s");
}

Future<void> voidShowUserData() async {
  const tiempo = 2;
  return Future.delayed(const Duration(seconds: tiempo), () => print("voidShowUserData $tiempo s"));
}

// Asincronía es útil cuando se quiere descargar un archivo de internet
void printFileData() async {
  // se crea otra función que utiliza la función asíncrona (traer el archivo de internet en este caso)
  // para hacer lo que se necesite con él
  downloadFile().then((value) => print);
  var file = await downloadFile();
  print(file);
}

// Se crea la función que en realidad ejecuta la tarea asíncrona
Future<String> downloadFile() async {
  Future.value("El archivo pesado se ha descargado"); // Estas dos líneas son equivalentes
  return Future.sync(() => "El archivo pesado se ha descargado");
}

