import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileScreen());
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appTitle = 'Profile Screen Example';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
          ),
          body: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: const [Text("Nombre de Usuario"), Text("Ciudad")],
        ),
        const Text("Icono de animal"),
      ],
    );
  }
}
