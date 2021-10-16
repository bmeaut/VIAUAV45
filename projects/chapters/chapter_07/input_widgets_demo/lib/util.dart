import 'package:intl/intl.dart';

enum PropertySearchType {
  forSale,
  forRent,
}

const double minPrice = 0;

const double maxPrice = 150;

String getFormattedDate(DateTime date) {
  return DateFormat("yyyy.MM.dd").format(date);
}