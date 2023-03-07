import 'package:booksy/user_data.dart';
import 'package:flutter/material.dart';

class AddBookButton extends StatelessWidget {
  final String bookId;

  const AddBookButton({required this.bookId, super.key});

  @override
  Widget build(BuildContext context) {
    UserData userData = UserData.of(context);
    // widget hace la llamada a AddBookButton !!!!! Es una llamada al widget al cual está asociado el estado
    // No hay necesidad de llamarlo ahora pues el widget es stateless
    // En la jerga de Flutter se le llama Lift State
    bool isSaved = userData.booksIds.contains(bookId);

    var addToLibraryButton = isSaved
        ? ElevatedButton(
            onPressed: () {
              _removeBookLibrary(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text("Remove from library"),
          )
        : ElevatedButton(
            onPressed: () {
              _addBookLibrary(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            child: const Text("Add to library"),
          );

    return Directionality(
        textDirection: TextDirection.ltr, child: addToLibraryButton);
  }

  void _addBookLibrary(BuildContext context) {
    // Llamar al backend y actualizar la DB del usuario
    // Actualizar la data del Inherited Widget utilizando el state del UserDataContainerWidget
    // con setState en UserData
    // Esta capa de vista se separa de la capa de datos al invocar el método del contexto
    var userDataContainerState = UserDataContainerState.of(context);
    userDataContainerState.addToLibrary(bookId);

    // Este bloque de setState es útil cuando la data es local, es decir, es una dependencia directa. Ahora que usamos InheritedWidget, la data es global.
    /*setState(() {
      // La convención es que aquí sólo tienne que pasar cosas asíncronas
      var newState = !isSaved;
      isSaved = newState;
    });*/
  }

  void _removeBookLibrary(BuildContext context) {
    var userDataContainerState = UserDataContainerState.of(context);
    userDataContainerState.removeToLibrary(bookId);
  }
}
