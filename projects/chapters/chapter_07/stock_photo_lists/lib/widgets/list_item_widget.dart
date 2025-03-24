import 'package:flutter/material.dart';

import '../pages/detailed_page.dart';
import '../data/photo_data_store.dart';

class ListItemWidget extends StatelessWidget {
  final StockPhoto item;

  const ListItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: ListTile(
          leading: AspectRatio(
            aspectRatio: 1 / 1,
            child: Hero(
              tag: item.id,
              child: Image.network(item.url, fit: BoxFit.cover),
            ),
          ),
          title: Text(item.title),
          subtitle: Text(item.description, maxLines: 1),
          onTap: () {
            Navigator.pushNamed(context, "/details", arguments: item);
          },
        ),
      ),
    );
  }
}
