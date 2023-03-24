import 'package:flutter/material.dart';
import 'package:users_app_widget_testing/home.dart';
import 'package:users_app_widget_testing/user_repositories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final UserRepository userRepository = UserRepository();
    return MaterialApp(
      title: 'User API Widget Testing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        repository: userRepository.getUsers(),
      ),
    );
  }
}
