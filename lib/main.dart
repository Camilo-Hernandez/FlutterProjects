import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const InternetConnectionExample());
}

class InternetConnectionExample extends StatelessWidget {
  const InternetConnectionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserInfoScreen(userId: 'camilo-hernandez-ruiz'),
    );
  }
}

class UserInfoScreen extends StatelessWidget {
  final String userId;

  UserInfoScreen({super.key, required this.userId});

  final TextEditingController _controllerUserInfo = TextEditingController();
  final TextEditingController _controllerPostResponse = TextEditingController();
  final TextEditingController _controllerPostStatusCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internet Connection Example'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Text(
                  'Pedir datos de usuario:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  userId,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    _getUserInfo('1');
                  },
                  child: const Text('Consultar datos del usuario'),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Introduce el usuario',
                    border: OutlineInputBorder(),
                  ),
                  controller: _controllerUserInfo,
                  maxLines: 10,
                  minLines: 4,
                ),
                const UserDataWidget(),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    _createPost('Mi nuevo post');
                  },
                  child: const Text('Crear Post'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Introduce el usuario',
                    border: OutlineInputBorder(),
                  ),
                  controller: _controllerPostResponse,
                  maxLines: 10,
                  minLines: 4,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _getUserInfo(String userId_) async {
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users/$userId_');
    final response = await http.get(url);
    _controllerUserInfo.value = TextEditingValue(text: response.body);
    print('Response status code: ${response.statusCode}');
    print('Response request: ${response.request}');
    print('Response headers: ${response.headers}');
    print('Response body: ${response.body}');
  }

  void _createPost(String title) async {
    final newPost = jsonEncode(<String, String>{
      'title': title,
      'body': 'Este es mi nuevo post',
      'userId': '10',
    });

    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final postHeaders = <String, String>{
      // Indica que el tipo de nuestro request va a ser JSON
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.post(
      url,
      body: newPost,
      headers: postHeaders,
    );

    _controllerPostResponse.value = TextEditingValue(text: response.body);
  }
}

class User {
  final int id;
  final String name;
  final String username;
  final String email;

  User({required this.id, required this.name, required this.username, required this.email});

  factory User.fromJSON(Map<String, dynamic> json) {
    // Tener cuidado con esto porque si el servidor cambia los datos del JSON Object, se cae la app en este punto
    return User(
        id: json['id'], name: json['name'], username: json['username'], email: json['email']);
  }
}

class UserDataWidget extends StatefulWidget {
  const UserDataWidget({super.key});

  @override
  State<UserDataWidget> createState() => _UserDataWidgetState();
}

class _UserDataWidgetState extends State<UserDataWidget> {
  final TextEditingController _controllerUserId = TextEditingController();
  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerUserUsername = TextEditingController();
  final TextEditingController _controllerUserEmail = TextEditingController();
  late Future<User> _futureUserData;

  @override
  void initState() {
    super.initState();
    _futureUserData = _getUserInfoWithModel('1');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: _futureUserData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  _getUserInfoWithModel('10');
                },
                child: const Text('Consultar datos con el modelo'),
              ),
              TextField(
                controller: TextEditingController(text: snapshot.data!.id.toString()),
                decoration: const InputDecoration(
                  labelText: 'Introduce el usuario',
                  border: UnderlineInputBorder(),
                ),
              ),
              TextField(
                controller: _controllerUserName,
                decoration: const InputDecoration(
                  labelText: 'Introduce el usuario',
                  border: UnderlineInputBorder(),
                ),
              ),
              TextField(
                controller: _controllerUserUsername,
                decoration: const InputDecoration(
                  labelText: 'Introduce el usuario',
                  border: UnderlineInputBorder(),
                ),
              ),
              TextField(
                controller: _controllerUserEmail,
                decoration: const InputDecoration(
                  labelText: 'Introduce el usuario',
                  border: UnderlineInputBorder(),
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Future<User> _getUserInfoWithModel(String userId_) async {
    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users/$userId_');
    final response = await http.get(url);
    try {
      // Se asume que la respuesta fue 200 OK
      return Future.delayed(const Duration(seconds: 2), () async {
        return User.fromJSON(jsonDecode(response.body));
      });
      /*_controllerUserId.value = TextEditingValue(text: user.id.toString());
      _controllerUserName.value = TextEditingValue(text: user.name);
      _controllerUserUsername.value = TextEditingValue(text: user.username);
      _controllerUserEmail.value = TextEditingValue(text: user.email);*/
    } catch (e) {
      throw Exception('Error al intentar obtener datos de usuario');
    }

    /* Otra forma de hacerlo con condicional
    if (response.statusCode == 200) {
    } else {
      throw Exception('Error al intentar obtener datos de usuario');
    }
    */
  }
}
