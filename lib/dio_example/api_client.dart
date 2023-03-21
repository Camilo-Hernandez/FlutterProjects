import 'dart:convert';

import 'package:dio/dio.dart';

import 'dio_example.dart';

class ApiClient {
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        connectTimeout: const Duration(seconds: 3),
        receiveTimeout: const Duration(seconds: 3)),
  );

  ApiClient() {
    // Se pueden tener distintos interceptores, como para obtener credenciales de usuario o poner un token entremedio
    _dio.interceptors.add(Logger());
  }

  Future<User> getUser(String userId_) async {
    final Response response = await _dio.get('/users/$userId_');
    return User.fromJSON(response.data);
  }

  Future<Post> createPost(String title, String body) async {
    // Los headers y la url no son necesarios con Dio
    // Es mejor poner esto dentro de try catch por si algo falla
    final newPost = jsonEncode(<String, String>{
      'title': title,
      'body': body,
    });

    final response = await _dio.post('/posts', data: newPost);

    return Post.fromJSON(response.data);
  }
}

class Logger extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    print('RESPONSE[${response.statusCode}] => BODY: ${response.data.toString()}');
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    print('REQUEST[{$options.method}] => PATH ${options.path}');
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    print('ERROR[{$err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
  }
}
