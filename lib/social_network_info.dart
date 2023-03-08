import 'package:flutter/material.dart';

class SocialNetworkInfo extends StatelessWidget {
  const SocialNetworkInfo({super.key});

  @override
  Widget build(BuildContext context) {
    const double iconSize = 40;
    return Column(
      children: [
        const Text(
          "Redes Sociales",
          style: TextStyle(fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.facebook,
                  size: iconSize,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: iconSize,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.call,
                  size: iconSize,
                )),
          ],
        ),
      ],
    );
  }
}
