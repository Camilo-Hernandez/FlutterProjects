import 'package:booksy/user_data.dart';
import 'package:flutter/material.dart';

class AddBookButton extends StatefulWidget {
  const AddBookButton({required this.bookId, super.key});

  final String bookId;

  // Se debe implementar otra clase que almacene el estado. De esta manera, se separa el estado del widget (valores numéricos, variables) del estado de su apariencia.
  @override
  _AddBookButtonState createState() {
    return _AddBookButtonState();
  }
}

class _AddBookButtonState extends State<AddBookButton> {
  _AddBookButtonState();

  @override
  Widget build(BuildContext context) {
    UserData userData = UserData.of(context);
    // widget hace la llamada a AddBookButton !!!!! Es una llamada al widget al cual está asociado el estado
    bool isSaved = userData.booksIds.contains(widget.bookId);

    var addToLibraryButton = isSaved
        ? ElevatedButton(
            onPressed: _manageBookLibrary,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text("Remove from library"),
          )
        : ElevatedButton(
            onPressed: _manageBookLibrary,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            child: const Text("Add to library"),
          );

    return Directionality(
        textDirection: TextDirection.ltr, child: addToLibraryButton);
  }

  void _manageBookLibrary() {
    // Llamar al backend y actualizar la DB del usuario
    // Actualizar la data del Inherited Widget

    // Este bloque de setState es útil cuando la data es local. Ahora que usamos InheritedWidget, la data es global.
    /*setState(() {
      // La convención es que aquí sólo tienne que pasar cosas asíncronas
      var newState = !isSaved;
      isSaved = newState;
    });*/
  }
}
