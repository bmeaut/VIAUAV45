import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/detailed_page.dart';
import '../data/photo_data_store.dart';

class GridItemWidget extends StatelessWidget {
  final StockPhoto item;

  const GridItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (BuildContext context, void Function() action) {
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
                  child: InkWell(onTap: action),
                ),
              ),
            ],
          ),
        );
      },
      openBuilder:
          (BuildContext context, void Function({Object returnValue}) action) {
        return DetailedPage(
          photo: item,
        );
      },
    );
  }
}
