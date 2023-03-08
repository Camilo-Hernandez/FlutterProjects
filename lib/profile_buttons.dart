import 'package:flutter/material.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        ProfileButton("Agregar amigo", Colors.green),
        ProfileButton("Enviar mensaje", Colors.blue),
      ],
    );
  }
}

class ProfileButton extends StatelessWidget {
  final String text;
  final Color color;

  const ProfileButton(
    this.text,
    this.color, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: Text(text),
    );
  }
}
