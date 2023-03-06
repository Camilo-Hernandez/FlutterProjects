import 'package:flutter/material.dart';

class BookDescription extends StatelessWidget {
  final String bookTitle;
  final String authorName;
  final String bookDescription;

  const BookDescription(this.bookTitle, this.authorName, this.bookDescription,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        bookTitle,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black87, fontSize: 30),
      ),
      Text(
        authorName,
        textDirection: TextDirection.ltr,
        style: const TextStyle(color: Colors.black54, fontSize: 25),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 20),
      ),
      Text(
        bookDescription,
        textDirection: TextDirection.ltr,
        style: const TextStyle(color: Colors.black54, fontSize: 20),
      ),
    ]);
  }
}
