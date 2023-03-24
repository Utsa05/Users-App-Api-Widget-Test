import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:users_app_widget_testing/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final Dio _dio = Dio();

  Future<List<User>> getUsers() async {
    final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/users"),
        headers: {"Content-Type": "application/json"});

    print(response.statusCode);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);

      return jsonList.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception("Users not got");
    }
  }
}
