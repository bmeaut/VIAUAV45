import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/photo_data_store.dart';

class DetailedPage extends StatelessWidget {

  const DetailedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photo = ModalRoute.of(context)!.settings.arguments as StockPhoto;
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AspectRatio(
            aspectRatio: 600 / 400,
            child: Hero(
              tag: photo.id,
              child: Image.network(
                photo.url,
                loadingBuilder: (context, child, loading) {
                  if (loading == null) {
                    return child;
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              photo.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              photo.description,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
