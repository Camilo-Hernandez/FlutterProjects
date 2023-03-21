import 'package:flutter/material.dart';
import 'package:network_connection_example/dio_example/api_client.dart';

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
                    ApiClient().getUser('1').then((user) {
                      _controllerUserInfo.value = TextEditingValue(text: user.name);
                    });
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
                const UserData(),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    ApiClient().createPost('Mi nuevo post', 'Este es mi nuevo post').then((post) {
                      _controllerPostResponse.value = TextEditingValue(
                          text: post.id
                              .toString()); // No es algo que estamos seteando, nos lo devuelve la api
                    });
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

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  final TextEditingController _controllerUserEmail = TextEditingController();
  late Future<User> _futureUserData;

  @override
  void initState() {
    super.initState();
    _futureUserData = ApiClient().getUser('1');
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
              const Text('Datos del usuario'),
              TextField(
                controller: TextEditingController(text: snapshot.data!.id.toString()),
                decoration: const InputDecoration(
                  labelText: 'Introduce el usuario',
                  border: UnderlineInputBorder(),
                ),
              ),
              TextField(
                controller: TextEditingController(text: snapshot.data!.username),
                decoration: const InputDecoration(
                  labelText: 'Introduce el usuario',
                  border: UnderlineInputBorder(),
                ),
              ),
              TextField(
                controller: TextEditingController(text: snapshot.data!.name),
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
}

class Post {
  final int id;
  final String title;
  final String body;

  Post(this.id, this.title, this.body);

  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(json['id'], json['title'], json['body']);
  }
}
