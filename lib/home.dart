import 'package:flutter/material.dart';

import 'package:users_app_widget_testing/user_repositories.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserRepository repository = UserRepository();
  @override
  void initState() {
    super.initState();
    repository.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("User"),
      ),
      body: FutureBuilder(
          future: repository.getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(
                        data![index].name,
                        style: const TextStyle(fontSize: 20.0),
                      ),
                      subtitle: Text(
                        data[index].email,
                        style: const TextStyle(fontSize: 17.0),
                      ),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
