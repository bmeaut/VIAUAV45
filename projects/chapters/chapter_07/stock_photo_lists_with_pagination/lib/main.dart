import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_photo_lists_with_pagination/data/photo_data_store.dart';
import 'package:stock_photo_lists_with_pagination/presentation/blocs/list_bloc.dart';
import 'package:stock_photo_lists_with_pagination/presentation/pages/detailed_page.dart';
import 'package:stock_photo_lists_with_pagination/presentation/pages/list_page.dart';

void main() {
  runApp(const ListApp());
}

class ListApp extends StatelessWidget {
  const ListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ListBloc(photoDataStore: PhotoDataStore()),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const ListPage(),
        routes: {"/details": (context) => const DetailedPage()},
      ),
    );
  }
}
