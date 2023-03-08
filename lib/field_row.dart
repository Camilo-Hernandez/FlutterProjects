import 'package:flutter/material.dart';

class FieldRow extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;

  const FieldRow(
    this.text1,
    this.text2,
    this.text3, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.book,
          size: 50,
        ),
        // Permite u obliga que la columna se contuviera dentro del espacio asignado
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(text1),
          Text(text2),
        ])),
        Text(
          text3,
        ),
      ],
    );
  }
}
