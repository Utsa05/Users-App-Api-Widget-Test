import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:users_app_widget_testing/home.dart';
import 'package:users_app_widget_testing/user_model.dart';

void main() {
  testWidgets('Users', (tester) async {
    List<User> users = [
      User(
          id: 1,
          name: "John Smith",
          username: "John",
          email: "john@gmail.com",
          address: Address(
              street: "street",
              suite: "suite",
              city: "city",
              zipcode: "zipcode",
              geo: Geo(lat: "lat", lng: "lng")),
          phone: "phone",
          website: "website",
          company: Company(name: "name", catchPhrase: "catchPhrase", bs: "bs")),
      User(
          id: 1,
          name: "Marry Smith",
          username: "Marry",
          email: "marry@gmail.com",
          address: Address(
              street: "street",
              suite: "suite",
              city: "city",
              zipcode: "zipcode",
              geo: Geo(lat: "lat", lng: "lng")),
          phone: "phone",
          website: "website",
          company: Company(name: "name", catchPhrase: "catchPhrase", bs: "bs"))
    ];

    Future<List<User>> mockFetchUsers() async {
      return Future.delayed(const Duration(seconds: 1), () => users);
    }

    await tester.pumpWidget(MaterialApp(
      home: HomePage(
        repository: mockFetchUsers(),
      ),
    ));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpAndSettle();

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(users.length));

    for (var user in users) {
      expect(find.text(user.name), findsOneWidget);
      expect(find.text(user.email), findsOneWidget);
    }
  });
}
