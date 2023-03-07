import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: KeysApp(),
  ));
}

class KeysApp extends StatefulWidget {
  const KeysApp({Key? key}) : super(key: key);

  @override
  State<KeysApp> createState() => _KeysAppState();
}

class _KeysAppState extends State<KeysApp> {
  static Color rojo = const Color.fromARGB(100, 200, 0, 0);
  static Color verde = const Color.fromARGB(100, 0, 200, 0);

  var celdas = [
    ColorCelda(
      color: rojo,
      label: "Rojo",
      key: ObjectKey(rojo),
    ),
    ColorCelda(
      color: verde,
      label: "Verde",
      key: ObjectKey(verde),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejemplo de Keys"),
      ),
      body: Center(
        child: Column(
          children: celdas,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _swapColors,
        child: const Icon(Icons.update_rounded),
      ),
    );
  }

  _swapColors() {
    setState(() {
      var temp = celdas[0];
      celdas[0] = celdas[1];
      celdas[1] = temp;
    });
  }
}

class ColorCelda extends StatefulWidget {
  final Color color;
  final String label;

  const ColorCelda({
    required this.color,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  _ColorCeldaState createState() => _ColorCeldaState();
}

class _ColorCeldaState extends State<ColorCelda> {
  late Color color;
  late String label;

  @override
  void initState() {
    super.initState();
    color = widget.color;
    label = widget.label;
  }

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        child: ListTile(
          // Elemento de texto con padding perfecto para una lista
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          title: Text(label),
        ),
      );
}
