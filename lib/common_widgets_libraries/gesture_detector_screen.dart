import 'package:flutter/material.dart';

class GestureDetectionScreen extends StatefulWidget {
  const GestureDetectionScreen({super.key});

  @override
  State<GestureDetectionScreen> createState() => _GestureDetectionScreenState();
}

class _GestureDetectionScreenState extends State<GestureDetectionScreen> {
  bool _isLightOn = false;
  Color lightColor = Colors.yellow.shade100;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          Icons.lightbulb_outline,
          size: 60,
          color: _isLightOn ? lightColor : Colors.black,
        ),
        const SizedBox(height: 20),
        // Cualquier widget puede reaccionar a los gestos del usuario con GestureDetector
        // Observad el catálogo de propiedades que tiene para ver todos los gestos posibles
        GestureDetector(
          onTap: () {
            setState(() {
              _isLightOn = !_isLightOn;
            });
          },
          child: Container(
            color: Colors.yellow.shade600,
            padding: const EdgeInsets.all(10),
            child: Text(
              "Encender luz".toUpperCase(),
            ),
          ),
        ),
        const SizedBox(height: 30),
        GestureDetector(
          onDoubleTap: () {
            setState(() {
              lightColor = Colors.red.shade200;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red.shade200,
            ),
            padding: const EdgeInsets.all(40),
            child: const Text("Double tap"),
          ),
        ),
        const SizedBox(height: 30),
        GestureDetector(
          onLongPress: () {
            setState(() {
              lightColor = Colors.yellow.shade200;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow.shade200,
            ),
            padding: const EdgeInsets.all(40),
            child: const Text("Long tap"),
          ),
        ),
      ]),
    );
  }
}
