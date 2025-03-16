import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/search_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Search BloC Demo',
      home: BlocProvider(
        create: (_) => SearchBloc(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search user")),
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
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              buildWhen: (_, state) => state is SearchResultListState,
              builder: (context, state) {
                if (state is SearchResultListState) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      var user = state.users[index];
                      return SizedBox(
                        height: 100,
                        child: Row(
                          spacing: 8,
                          children: [
                            Image.network(user.imageUrl, width: 90),
                            Text(user.name),
                          ],
                        ),
                      );
                    },
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
