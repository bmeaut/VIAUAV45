import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/bloc/search_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => SearchBloc(),
        child: const MyHomePage(),
      ),
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
              onChanged: (text) {
                context.read<SearchBloc>().add(SearchUpdateNameEvent(text));
              },
            ),
          ),
          Expanded(
            child: BlocConsumer<SearchBloc, SearchState>(
              listenWhen: (_, state) => state is SearchErrorEventState,
              listener: (context, state) {
                if (state is SearchErrorEventState) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              buildWhen: (_, state) => state is SearchResultListState,
              builder: (context, state) {
                if (state is SearchResultListState) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (context, index) {
                      var user = state.users[index];
                      return SizedBox(
                        height: 90,
                        child: Row(
                          children: [
                            Image.network(user.imageUrl, width: 90),
                            Text(user.name),
                          ],
                        ),
                      );
                    },
                    itemCount: state.users.length,
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
