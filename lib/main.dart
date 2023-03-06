import 'package:booksy/user_data.dart';
import 'package:flutter/material.dart';

import 'book_screen.dart';

void main() {
  // MaterialApp() maneja muchísimas características que los developers no tenenmos que gestionar manualmente.
  // Sigue los lineamientos de Material Design de Google publicados en m3.material.io

  runApp(const MaterialApp(
    home: Booksy(),
    title: "Booksy",
  ));

  // Ahora con Cupertino:
  /* runApp(const CupertinoApp(
    home: Booksy(),
    title: "Booksy",
  ));*/
}

class Booksy extends StatelessWidget {
  const Booksy({super.key});

  static const bookTitle = "The Hitchhiker's Guide to the Galaxy";
  static const authorName = "Douglas Adams";
  static const bookDescription =
      "It's an ordinary Thursday morning for Arthur Dent... until his house gets demolished. The Earth follows shortly after to make way for a new hyperspace express route, and Arthur's best friend has just announced that he's an alien.";
  static const bookCoverURI = "res/cover.jpg";
  static const List<String> booksIds = ["douglas-hitch"];

  @override
  Widget build(BuildContext context) {
/*
    return CupertinoPageScaffold(
      // Con Cupertino
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Booksy"),
      ),
      child: Container(
    // Hasta aquí Cupertino
*/
    return Scaffold(
      // Con MaterialApp
      appBar: AppBar(
        title: const Text("Booksy"),
      ),
      body: const UserData(
          booksIds: booksIds,
          // se obtiene de una base de datos, en servidor por ejemplo, consultando al backend
          child: BookScreen(
            bookTitle: bookTitle,
            authorName: authorName,
            bookDescription: bookDescription,
            bookCoverURI: bookCoverURI,
          )),
    );
  }
}
