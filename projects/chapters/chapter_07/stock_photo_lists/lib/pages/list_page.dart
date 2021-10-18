import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/grid_item_widget.dart';
import '../widgets/list_item_widget.dart';
import '../data/photo_data_store.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var startingIndex = 0;
  final listOffset = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lists & Grids"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // ... is the spread operator
              ...Iterable.generate(
                10,
                (id) {
                  var item = StockPhoto.fromId(id);
                  return ListItemWidget(
                    item: item,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // TODO ListView for small number of items
      /*body: ListView(
        children: [
          ...Iterable.generate(100000, (id) {
            var item = StockPhoto.fromId(id);
            return ListItemWidget(
              item: item,
            );
          })
        ],
      ),*/
      // TODO ListView.builder for possibly infinite number of items, itemExtent helps optimization
      /*body: ListView.builder(
        itemExtent: 80,
        itemBuilder: (context, index){
          var item = StockPhoto.fromId(index);
          return ListItemWidget(item: item);
        },
      )*/
      // TODO ListView.separated for exact number of items with separator views
      /*body: ListView.separated(
        itemCount: 1000000,
        itemBuilder: (context, index) {
          var item = StockPhoto.fromId(index);
          return ListItemWidget(item: item);
        },
        separatorBuilder: (context, index) => Container(
          height: 16,
          alignment: Alignment.center,
          child: Container(
            height: 1,
            color: Colors.red.withOpacity(1),
          ),
        ),
      ),*/
      // TODO GridView.count for displaying a fixed number of items on the cross axis
      /*body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        children: [
          ...Iterable.generate(
            100000,
            (id) {
              var item = StockPhoto.fromId(id);
              return GridItemWidget(
                item: item,
              );
            },
          )
        ],
      ),*/
      // TODO GridView.extent for defining a maximum cross axis extent of the items
      /*body: GridView.extent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: 1 / 1,
        children: [
          ...Iterable.generate(
            100000,
                (id) {
              var item = StockPhoto.fromId(id);
              return GridItemWidget(
                item: item,
              );
            },
          )
        ],
      )*/
      // TODO GridView.builder for possibly infinite number of items, mainAxisExtent helps optimization
      /*body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 100,
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 1 / 1,
        ),
        itemBuilder: (context, index) {
          var item = StockPhoto.fromId(index);
          return GridItemWidget(item: item);
        },
      ),*/
      // TODO Mix up scrollable headers, lists and grids with the Sliver framework
      /*body: Scrollbar(
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              startingIndex = Random().nextInt(200);
            });
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                title: const Text("Flexible list view"),
                expandedHeight: 240,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    "https://picsum.photos/600/400",
                    fit: BoxFit.cover,
                  ),
                ),
                floating: true,
                snap: true,
                pinned: true,
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    ...Iterable.generate(
                      listOffset,
                      (id) {
                        var item = StockPhoto.fromId(id + startingIndex);
                        return ListItemWidget(
                          item: item,
                        );
                      },
                    )
                  ]),
                ),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var item = StockPhoto.fromId(index + startingIndex + listOffset);
                    return GridItemWidget(item: item);
                  },
                  childCount: 10,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4),
              )
            ],
          ),
        ),
      ),*/
    );
  }
}
