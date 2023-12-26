import 'package:intl/intl.dart';

class StaticDaily {
  totalHour({required List staticData, required List? dailyHour}) {
    final year = DateTime.now().year;
    final month = DateTime.now().month;
    final today = DateTime.now().day;
    double totalSatrday = 0;
    double totalsunday = 0;
    double totalmonday = 0;
    double totaltuesday = 0;
    double totalwenday = 0;
    double totalthersday = 0;
    double totalfriday = 0;
    int totalToday = 0;
    for (var element in staticData) {
      if (DateFormat()
          .add_MEd()
          .format(DateTime.parse(element["created_at"]))
          .contains("Sun")) {
        totalsunday += int.parse(element['hours']);
      }
      if (DateFormat()
          .add_MEd()
          .format(DateTime.parse(element["created_at"]))
          .contains("Mon")) {
        totalmonday += int.parse(element['hours']);
      }
      if (DateFormat()
          .add_MEd()
          .format(DateTime.parse(element["created_at"]))
          .contains("Tue")) {
        totaltuesday += int.parse(element['hours']);
      }
      if (DateFormat()
          .add_MEd()
          .format(DateTime.parse(element["created_at"]))
          .contains("Wed")) {
        totalwenday += int.parse(element['hours']);
      }
      if (DateFormat()
          .add_MEd()
          .format(DateTime.parse(element["created_at"]))
          .contains("Thu")) {
        totalthersday += int.parse(element['hours']);
      }
      if (DateFormat()
          .add_MEd()
          .format(DateTime.parse(element["created_at"]))
          .contains("Fri")) {
        totalfriday += int.parse(element['hours']);
      }
      if (DateFormat()
          .add_MEd()
          .format(DateTime.parse(element["created_at"]))
          .contains("Sat")) {
        totalSatrday += int.parse(element['hours']);
      }
      if (element["created_at"] ==
          DateTime(year, month, today).toString().split(" ")[0]) {
        totalToday += int.parse(element['hours']);
      }
    }
    return dailyHour = [
      totalSatrday,
      totalsunday,
      totalmonday,
      totaltuesday,
      totalwenday,
      totalthersday,
      totalfriday,
      totalToday
    ];
  }
}
