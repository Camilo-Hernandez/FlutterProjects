import 'package:flutter/cupertino.dart';

class UserDescription extends StatelessWidget {
  const UserDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          "Soy fanático de los libros de ciencia ficción y todo lo que me haga imaginar nuevos mundos",
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ));
  }
}
