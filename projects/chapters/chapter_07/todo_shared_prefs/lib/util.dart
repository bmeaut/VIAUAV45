import 'package:intl/intl.dart';

String getFormattedDate(DateTime date) {
  return DateFormat("yyyy.MM.dd").format(date);
}

DateTime parseDate(String date) {
  final splitDate = date.split(".");
  return DateTime(int.parse(splitDate[0]), int.parse(splitDate[1]), int.parse(splitDate[2]));
}