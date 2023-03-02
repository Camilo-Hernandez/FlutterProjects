import 'package:css_colors/css_colors.dart'; // para los colores
import 'package:flutter/cupertino.dart'; // para el estilo de iOS

/* Hot reload: actualizar la UI en la jerarquía de Widgets
 fuera del método build no hay hot reload
  Mantiene el estado de la app
  Re-ejecuta el método build que pasa por la jerarquía de Widgets

 Hot restart:
 Reinicia el estado de la app
 Re-ejecuta main()
*/
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String text = "Chaooooooo!!";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        textDirection: TextDirection.ltr,
        style: const TextStyle(
          color: CSSColors.aquamarine,
          fontSize: 32,
        ),
        maxLines: 5,
      ),
    ); // left to right)
  }
}
