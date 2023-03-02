import 'dart:io'; // para stdout
import 'dart:developer';

const thisIsGlobal = "Camilo";

void main() {
  print('App iniciada'); // se pierde en el log
  //runApp(const Text("Hola Flutter")); // así solo falla porque le faltan direcciones
  // Se verán bien en el logging
  stdout.write('Hola desde stdout');
  stderr.write('Este es un error');
  log("Hola desde developer tools", name: "Mi tipo en Logging");

  var texto = ''; // poner un breakpoint en estas dos líneas para ver el cambio en el debugger
  texto = 'Hola Flutter';

  for (var counter = 0; counter < 10; counter++) {
    doSomething(counter);
  }
}

void doSomething(int counter) {
  print("Iteración: $counter");
}
