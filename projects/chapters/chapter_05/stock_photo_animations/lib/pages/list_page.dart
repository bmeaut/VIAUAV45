import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/grid_item_widget.dart';
import '../widgets/list_item_widget.dart';
import '../data/photo_data_store.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var startingIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            startingIndex = Random().nextInt(200);
          });
        },
        child: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: Text("Flexible list view"),
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
              padding: EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  ...Iterable.generate(
                    10,
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
              delegate: SliverChildBuilderDelegate((context, index) {
                var item = StockPhoto.fromId(index + startingIndex);
                return GridItemWidget(item: item);
              }, childCount: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
            )
          ],
        ),
      ),
      /*body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ...Iterable.generate(100, (id){
                var item = StockPhoto.fromId(id);
                return ListItemWidget(item: item,);
              })
            ],
          ),
        ),
      ),*/
      /*body: ListView(
        children: [
          ...Iterable.generate(100000, (id){
            var item = StockPhoto.fromId(id);
            return ListItemWidget(item: item,);
          })
        ],
      ),*/
      /*body: ListView.builder(
        itemExtent: 80,
        itemBuilder: (context, index){
          var item = StockPhoto.fromId(index);
          return ListItemWidget(item: item);
        },
      )*/
      /*body: ListView.separated(
        itemBuilder: (context, index) {
          var item = StockPhoto.fromId(index);
          return ListItemWidget(item: item);
        },
        separatorBuilder: (context, index) => Container(
          height: 16,
          alignment: Alignment.center,
          child: Container(
            height: 1,
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
        itemCount: 1000000,
      ),*/
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
              return Hero(
                tag: id,
                child: GridItemWidget(
                  item: item,
                ),
              );
            },
          )
        ],
      ),*/
      /*body: GridView.extent(
        maxCrossAxisExtent: 300,
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
      /*body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          childAspectRatio: 1 / 1,
        ),
        itemBuilder: (context, index) {
          var item = StockPhoto.fromId(index);
          return GridItemWidget(item: item);
        },
      ),*/
    );
  }
}
