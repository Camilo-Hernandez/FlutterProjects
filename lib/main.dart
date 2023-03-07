/*
Los Build Context son los contextos de construcción del componente
Es decir, saben sobre su padre, y el padre sabe del abuelo...
El Build Context abre el conocimiento de la jerarquía hacia arriba.
Pero no del componente mismo ni de sus hijos.
Si se intentan buscar el mismo componente o sus hijos, tira error.
El build context se invoca a través del método of(BuildContext context)
el cual retorna el Widget de más arriba en el árbol.
Este context no es más que el Element asociado al Widget en el momento en que se instancia.
Nos da el método build del elemento que está siendo dibujado.
Nos da información del árbol de jerarquías en que se inserta.
Las herramientas de manejo de BLoC, Provider y Inherited Widget utilizan el context para manejar Widgets de más arriba

Referencia: https://www.udemy.com/course/curso-de-flutter-dart-crea-apps-multiplataforma-ios-android/learn/lecture/30439602#content
 */

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: EvasionOfContextError(),
      title: "Build Context Example",
    ),
  );
}

// Ejemplo de Reparar el error del Widget que está más abajo.
// Es el mismo código sólo que se le ha creado un builder
// Ejemplo del fallo de .of(context) cuando se le pasa el mismo contexto del elemento
class EvasionOfContextError extends StatelessWidget {
  const EvasionOfContextError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejemplo Falla del contexto"),
      ),
      body: Builder(
        builder: (BuildContext newContext) {
          // Al presionarse, buscaré un Scaffold hacia arriba partiendo del contexto
          return ElevatedButton(
            onPressed: () {
              Scaffold.of(newContext)
                  .showBottomSheet((newContext) => const ListTile(
                        contentPadding: EdgeInsets.only(bottom: 200, left: 30),
                        title: Text("Me han activado !"),
                        focusColor: Color(0xFF003344),
                      ));
            },
            child: const Text(
              "SIIIUUU!!",
            ),
          );
        },
      ),
    );
  }
}

// Ejemplo del fallo de .of(context) cuando se le pasa el mismo contexto del elemento
class MyWidgetFailure extends StatelessWidget {
  const MyWidgetFailure({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejemplo Falla del contexto"),
      ),
      body: ElevatedButton(
        onPressed: () {
          // Al presionarse, buscaré un Scaffold hacia arriba partiendo del contexto
          Scaffold.of(context).showBottomSheet((context) => const ListTile(
                contentPadding: EdgeInsets.only(bottom: 200, left: 30),
                title: Text("Me han activado !"),
                focusColor: Color(0xFF003344),
              ));
        },
        child: const Text(
          "SIIIUUU!!",
        ),
      ),
    );
  }
}

class BuildContextApp extends StatelessWidget {
  const BuildContextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Build Context Example"),
      ),
      body: const FirstView(),
    );
  }
}

class FirstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Holaaa 🧜🏻‍♀️"),
        SecondViewWidget(),
        ElevatedButton(
            onPressed: () {
              // Al presionarse, buscaré un Scaffold hacia arriba partiendo del contexto
              Scaffold.of(context).showBottomSheet((context) => const ListTile(
                    contentPadding: EdgeInsets.only(bottom: 200, left: 30),
                    title: Text("Me han activado !"),
                    focusColor: Color(0xFF003344),
                  ));
            },
            child: const Text(
              "SIIIUUU!!",
            ))
      ],
    );
  }

  const FirstView({super.key});
}

class SecondViewWidget extends StatefulWidget {
  @override
  State<SecondViewWidget> createState() {
    return SecondViewState();
  }
}

class SecondViewState extends State<SecondViewWidget> {
  @override
  Widget build(BuildContext context) {
    return const Text("Bienvenido, usuario aleatorio! 🫥");
  }
}
