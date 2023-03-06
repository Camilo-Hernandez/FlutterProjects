import 'package:flutter/material.dart';

class AddBookButton extends StatefulWidget {
  const AddBookButton({super.key});

  // Se debe implementar otra clase que almacene el estado. De esta manera, se separa el estado del widget (valores numéricos, variables) del estado de su apariencia.
  @override
  _AddBookButtonState createState() {
    return createStateLogic();
  }

  _AddBookButtonState createStateLogic() {
    return _AddBookButtonState();
  }
}

class _AddBookButtonState extends State<AddBookButton> {
  bool _isSaved = true;

  _AddBookButtonState();

  @override
  Widget build(BuildContext context) {
    var addToLibraryButton = _isSaved
        ? ElevatedButton(
            onPressed: _manageBookLibrary,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            child: const Text("Add to library"),
          )
        : ElevatedButton(
            onPressed: _manageBookLibrary,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: const Text("Remove from library"),
          );

    return Directionality(
        textDirection: TextDirection.ltr, child: addToLibraryButton);
  }

  void _manageBookLibrary() {
    // Llamar al backend y actualizar la DB del usuario
    setState(() {
      // La convención es que aquí sólo tienne que pasar cosas asíncronas
      var newState = !_isSaved;
      _isSaved = newState;
    });
  }
}
