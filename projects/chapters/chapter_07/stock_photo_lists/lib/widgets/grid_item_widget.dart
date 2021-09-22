import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/detailed_page.dart';
import '../data/photo_data_store.dart';

class GridItemWidget extends StatelessWidget {
  final StockPhoto item;

  const GridItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: item.id,
              child: Image.network(
                item.url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailedPage(
                        photo: item,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
