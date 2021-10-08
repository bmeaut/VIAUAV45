import 'package:flutter/material.dart';
import 'package:flutter_bloc_starter/remote_service.dart';

late List<User> userList;
void main() async {
  userList = await remoteService.searchUsers("A");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search user"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Search term",
                enabledBorder: UnderlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                var user = userList[index];
                return SizedBox(
                  height: 90,
                  child: Row(
                    children: [
                      Image.network(user.imageUrl, width: 90,),
                      Text(user.name),
                    ],
                  ),
                );
              },
              itemCount: userList.length,
            ),
          ),
        ],
      ),
    );
  }
}
