import 'package:intl/intl.dart';

extension CustomDateExtension on DateTime {
  DateTime getDateOnly() {
    return DateTime(year, month, day);
  }

  String getMonthNameAndYearSequence() {
    return DateFormat('MM/yyyy').format(DateTime(year, month));
  }

  String getCurrentDateYearMonth() {
    return DateFormat('yyyyMM').format(DateTime.now());
  }

  String getCurrentDate() {
    return DateFormat('dd/MM/yyyy').format(DateTime.now());
  }
}
