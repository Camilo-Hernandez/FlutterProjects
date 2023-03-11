import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<StatefulWidget> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  bool isButtonDisabled = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 30, fontFamily: "Times new roman")),
              onPressed: () {
                debugPrint("Botón texto presionado");
              },
              child: const Text("TextButton")),
          OutlinedButton(
              onPressed: () {
                debugPrint("OutlinedButton - Botón delineado presionado");
              },
              child: const Text("OutlinedButton")),
          ElevatedButton(
              onPressed: () {
                debugPrint("ElevatedButton activador presionado");
                setState(() {
                  isButtonDisabled = !isButtonDisabled;
                });
              },
              child: const Text("Activador")),
          ElevatedButton(
            onPressed: isButtonDisabled
                ? null
                : () {
                    debugPrint("ElevatedButton - Botón elevado presionado");
                  },
            // null desactiva el botón. Aquí preguntamos por el boolean para activarlo o desactivarlo
            child: const Text("ElevatedButton"),
          ),
        ],
      ),
    );
  }
}
