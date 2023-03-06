import 'package:booksy/UserData.dart';
import 'package:flutter/material.dart';

import 'AddBookButton.dart';
import 'BookDescription.dart';

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

  static const booksIds = ["douglas-hitch"];

  @override
  Widget build(BuildContext context) {
    var bookCoverURI = "res/cover.jpg";

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
      body: UserData(
          booksIds:
              booksIds, // se obtiene de una base de datos, consultando al backend
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            color: Colors.white,
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [BoxShadow(blurRadius: 8)],
                          color: Colors.white,
                          backgroundBlendMode: BlendMode.lighten,
                        ),
                        child: Image(
                          image: AssetImage(bookCoverURI),
                          width: 200,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 40),
                      ),
                      const BookDescription(
                        "The Hitchhiker's Guide to the Galaxy",
                        "Douglas Adams",
                        "It's an ordinary Thursday morning for Arthur Dent... until his house gets demolished. The Earth follows shortly after to make way for a new hyperspace express route, and Arthur's best friend has just announced that he's an alien.",
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      const AddBookButton(),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
