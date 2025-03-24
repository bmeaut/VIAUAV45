import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class StockPhoto extends Equatable {
  static final List<StockPhoto?> _cache = [];

  factory StockPhoto.fromId(int id) {
    while (_cache.length <= id) {
      _cache.add(null);
    }
    if (_cache[id] == null) {
      _cache[id] = StockPhoto._generate(id);
    }
    return _cache[id]!;
  }

  final int id;
  final String url;
  final String title;
  final String description;
  final double rating;

  StockPhoto._generate(this.id)
    : url = "https://picsum.photos/600/400?$id",
      title = lorem(paragraphs: 1, words: 2),
      description = lorem(paragraphs: 2, words: 40),
      rating = Random().nextDouble() * 5;

  @override
  List<Object?> get props => [id, url, title, description, rating];
}
