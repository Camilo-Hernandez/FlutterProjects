import 'package:flutter/cupertino.dart';

class UserData extends InheritedWidget {
  final List<String> booksIds;

  const UserData({
    Key? key,
    required this.booksIds, // Dato global a la app
    required Widget child, // Hijo en el árbol de Jerarquía
  }) : super(key: key, child: child);

  static UserData of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<UserData>()!;

  @override
  bool updateShouldNotify(covariant UserData oldWidget) {
    // ¿Debo notificar a mis hijos para que se actualicen?
    // Cada vez que se reconstruye el Widget, se llama este método, es decir, cada vez que llama a setState
    // Se retorna el boolean que dice si se debe propagar la notificación a todos los demás.
    return booksIds != oldWidget.booksIds;
  }
}

/*
 Dado que en Flutter todos los Widgets son inmutables, la forma en la que cambio el estado
 de un Inherited Widget es envolviéndolo en un Stateful Widget, como se hace a continuación:
 */

class UserDataContainerWidget extends StatefulWidget {
  final Widget child;

  const UserDataContainerWidget({super.key, required this.child});

  @override
  State<UserDataContainerWidget> createState() {
    return UserDataContainerState();
  }
}

class UserDataContainerState extends State<UserDataContainerWidget> {
  List<String> localBooksIds = []; // podría venir del server

  @override
  Widget build(BuildContext context) {
    return UserData(
        booksIds: List.from(localBooksIds),
        // Copiando los elementos en otra lista ya que puede no tener la misma dirección de memoria o ser otro tipo de Collection
        // Inicializa con la lista vacía. El botón, a través del método _manageBookLibrary() va a meter nuevos ids.
        child: widget.child); // Como es un wrapper, el hijo es el widget
  }

  static UserDataContainerState of(BuildContext context) =>
      context.findAncestorStateOfType<UserDataContainerState>()!;

  void addToLibrary(String bookId) {
    // Cada que entra aquí, vuelve a crear Widget, es decir, vuelve a llamar el método Build
    setState(() {
      localBooksIds.add(bookId);
    });
  }

  void removeToLibrary(String bookId) {
    setState(() {
      localBooksIds.remove(bookId);
    });
  }
}
