import 'package:flutter/cupertino.dart';

class UserData extends InheritedWidget {
  final List<String> booksIds; // "123" o "ABS342" o "douglas-hit"
  const UserData({
    Key? key,
    required this.booksIds,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: ¿Debo notificar a mis hijos para que se actualicen?
    return true;
  }
}
