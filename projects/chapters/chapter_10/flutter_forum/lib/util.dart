import 'package:intl/intl.dart';

extension DateTimeFormatter on DateTime {
  String format() {
    return DateFormat("yyyy.MM.dd hh:mm").format(this);
  }
}