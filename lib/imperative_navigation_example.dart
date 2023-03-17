/*
Todas las pantallas son Routes. Los Routes son widgets.
MaterialApp ya provee el Navigator API
El Navigator 1.0 pone las routes en el stack que es controlado de la forma imperativa con .push(), .pushNamed() y .pop()
El Navigator 2.0 es controlado de la forma declarativa con .pages(). Declarativo significa que las pages cambian con el cambio de estado.

Este ejemplo tiene la formas de navegación imperativa
 */

import 'package:flutter/material.dart';

void main() {
  var title = 'Navigation API Examples';
  runApp(MaterialApp(
    home: const HomeScreen(),
    title: title,
    routes: <String, WidgetBuilder>{
      // Poner el nombre de la ruta y el builder de la page
      // La ventaja es que se centraliza el directorio de todas las pantallas en un solo lugar
      '/third-screen': (context) => const ThirdScreen(""),
    },
    onGenerateRoute: (settings) {
      if (settings.name!.contains('third-screen')) {
        var uri = Uri.parse(settings.name!);
        if (uri.pathSegments.length >= 2) {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(builder: (context) => ThirdScreen(id));
        }
      }
      return null;
    },
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                // Al pasarle el contexto, busca un Navigator más arriba. Siempre lo encontrará en MaterialApp, la raíz.
                context,
                MaterialPageRoute(builder: (context) => const SecondScreen()),
              );
            },
            child: const Text('Navigator 1.0: Open route with .push()'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/third-screen',
                  // Cualquier Object puede ser pasado
                  arguments: 'Argumento pasado desde Home Screen');
            },
            child: const Text('Navigator 1.0: Open route with .pushNamed()'),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Go back with .pop()'),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen(String message, {super.key});

  @override
  Widget build(BuildContext context) {
    // No se necesita esta línea cuando
    // final message = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Tercera pantalla'),
            Text('Argumento: $this.message'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Volver con .pop()'))
          ],
        ),
      ),
    );
  }
}
