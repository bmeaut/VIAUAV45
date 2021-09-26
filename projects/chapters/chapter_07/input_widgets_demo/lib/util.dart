// TODO Define an enum for the property search type Radio group
import 'package:intl/intl.dart';

enum PropertySearchType { forSale, forRent }

// TODO Define min and max price constants
const double MIN_PRICE = 0;

const double MAX_PRICE = 150;

// TODO Define a function for date formatting
String getFormattedDate(DateTime date) {
  return DateFormat("yyyy.MM.dd").format(date);
}