import 'package:flutter/material.dart';
import 'package:profile_screen/profile_buttons.dart';
import 'package:profile_screen/profile_cover.dart';
import 'package:profile_screen/social_network_info.dart';
import 'package:profile_screen/user_description.dart';

import 'my_list_tile.dart';

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
                  MyListTile(
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
