import 'package:flutter/material.dart';

import 'add_book_button.dart';
import 'book_description.dart';

class BookScreen extends StatelessWidget {
  final String bookTitle;
  final String authorName;
  final String bookDescription;
  final String bookCoverURI;

  const BookScreen({
    super.key,
    required this.bookTitle,
    required this.authorName,
    required this.bookDescription,
    required this.bookCoverURI,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                BookDescription(
                  bookTitle,
                  authorName,
                  bookDescription,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                // Cambia el nombre para que busque uno diferente y verás que el botón cambia
                const AddBookButton(bookId: "douglas-hitch"),
                const Padding(
                  padding: EdgeInsets.only(top: 5),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
