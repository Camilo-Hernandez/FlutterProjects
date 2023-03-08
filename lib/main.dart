import 'package:flutter/material.dart';
import 'package:profile_screen/profile_buttons.dart';
import 'package:profile_screen/social_network_info.dart';
import 'package:profile_screen/user_description.dart';

import 'field_row.dart';

void main() {
  var appTitle = 'Profile Screen Example';
  runApp(MaterialApp(
    title: appTitle,
    home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: const ProfileScreen()),
  ));
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          const ProfileCover(),
          Expanded(
              child: SingleChildScrollView(
            child: Column(children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              const UserDescription(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(children: const [
                  SizedBox(height: 20),
                  FieldRow(
                      "Libros leídos",
                      "Número de libros que este usuario ha finalizado, hola Dolph, hola Jimena, cómo están? Les gusta el guacamole? Espero que sí",
                      "23"),
                  ListTile(
                    // Es rápido pero limitado
                    title: Text("Libros que quiero"),
                    subtitle: Text("Número de libros en la lista de deseos"),
                    leading: Icon(Icons.book, size: 50),
                    trailing: Text("100"),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 0), // Tiene su propio padding
                  ),
                  SizedBox(height: 20),
                  SocialNetworkInfo(),
                  SizedBox(
                      height:
                          20), // SizedBox es menos costoso computacionalmente
                  ProfileButtons(),
                ]),
              )
            ]),
          )),
        ]));
  }
}

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
