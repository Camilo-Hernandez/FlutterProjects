/*
Navigator 2.0 nace del querer de Flutter de convertirse en herramienta para diseño de páginas web
La idea es navegar a cualquier pantalla desde un link situado en cualquier parte.
Es una navegación más libre, mientras que en móvil, el flujo de la interacción se hace de forma controlada.

Page: objeto inmutable para configurar el stack de historial del Navigator
Navigator.pages: historial de pages en el stack.
Pages se convierten en routes.
Clase Route: controla la lista de pages a mostrar en el navigator y despacha las routes

Para conocer más sobre Navigator 2.0 se deben conocer las clases:
RouteInformationParser
RouterDelegate
BackButtonDispatcher
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const NavigationControl());
}

class NavigationControl extends StatefulWidget {
  const NavigationControl({super.key});

  @override
  State<NavigationControl> createState() {
    return _NavigationControlState();
  }
}

class _NavigationControlState extends State<NavigationControl> {
  var title = 'Navigation API Examples';
  String? screenSelected = '';
  String message = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
        pages: [
          MaterialPage(
              child: HomeScreen(
            onNavigate: (screenName) {
              setState(() {
                screenSelected = screenName;
              });
            },
            onNavigateToThirdScreen: (String value) {
              setState(() {
                screenSelected = ThirdScreen.screenName;
                // se le mete el id
                message = value;
              });
            },
          )),
          if (screenSelected == SecondScreen.screenName)
            const MaterialPage(child: SecondScreen()),
          if (screenSelected == ThirdScreen.screenName)
            MaterialPage(child: ThirdScreen(message)),
        ],
        onPopPage: (route, result) {
          // Se activa cuando una pantalla hace .pop()
          if (route.didPop(result)) return true;
          return false;
        },
      ),
      title: title,
    );
  }
}

typedef Message = String; // crear un alias para más legibilidad

class HomeScreen extends StatelessWidget {
  // Firma para callbacks que se llama cuando un valor subyaciente ha cambiado
  final ValueChanged<String> onNavigate;
  final ValueChanged<Message> onNavigateToThirdScreen;
  const HomeScreen(
      {super.key,
      required this.onNavigate,
      required this.onNavigateToThirdScreen});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              onNavigate('secondScreen');
            },
            child: const Text('Imperative: Open route with .push()'),
          ),
          ElevatedButton(
            onPressed: () {
              onNavigateToThirdScreen('ID Usuario');
            },
            child: const Text('Declarative: Open route with .pushNamed()'),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  static const String screenName = 'secondScreen';
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
  static const String screenName = 'thirdScreen';
  final String message;
  const ThirdScreen(this.message, {super.key});

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
            Text('Argumento: $message'),
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
