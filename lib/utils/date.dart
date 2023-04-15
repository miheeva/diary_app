import 'package:intl/intl.dart' show DateFormat;


class Locale {
  static const String RU = 'ru';
  static const String EN = 'en'; 
}

class InvalidStringDateError implements Exception {
  String cause;
  InvalidStringDateError(this.cause);
}

abstract class AbstractDateFormatter {
  String formatDate(DateTime date);
  DateTime fromString(String dateStr);
  String beautifulFormat(DateTime date);
  String beautifulFromString(String dateStr);
}

class DateFormatter implements AbstractDateFormatter {
  final DateFormat dateFormat = DateFormat.yMd();

  String formatDate(DateTime date) {
    return dateFormat.format(date);
  }

  DateTime fromString(String dateStr) => dateFormat.parse(dateStr);

  String beautifulFormat(DateTime date) {
    // initializeDateFormatting(locale, url)
    return '${date.day}.${date.month}';
  //  var formater = DateFormat(DateFormat.YEAR_MONTH_DAY, Locale.RU);
  //   return formater.format(date);
  }
  String beautifulFromString(String dateStr) {
    var date = fromString(dateStr);
    return beautifulFormat(date);
  }
}