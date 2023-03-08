import 'package:flutter/material.dart';

class ProfileCover extends StatelessWidget {
  const ProfileCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.bottomEnd, children: [
      const Image(image: AssetImage("assets/images/landscape2.jpeg")),
      Padding(
          padding: const EdgeInsets.all(25),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            DefaultTextStyle(
                style: const TextStyle(fontSize: 20, color: Colors.white),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "Camilo Hernández Ruiz",
                      ),
                      Text(
                        "Cali, Colombia",
                        style: TextStyle(fontSize: 15),
                      ),
                    ])),
            const SizedBox(
              width: 20,
            ),
            const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile-pic.jpg'),
                radius: 40),
          ])),
    ]);
  }
}
