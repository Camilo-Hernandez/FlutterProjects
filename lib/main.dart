import 'package:flutter/cupertino.dart';
import 'package:css_colors/css_colors.dart';

void main() {
  //runApp(const Text("Hola Flutter")); // así solo falla porque le faltan direcciones
  runApp(const Center(
      child: Text("Hola Flutter",
          textDirection: TextDirection.ltr,
          style: TextStyle(color: CSSColors.aquamarine)))); // left to right)
}
