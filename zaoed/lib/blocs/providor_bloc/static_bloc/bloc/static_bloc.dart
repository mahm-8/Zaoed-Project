import 'dart:async';
import 'package:intl/intl.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaoed/constants/imports.dart';

part 'static_event.dart';
part 'static_state.dart';

final supabase = Supabase.instance.client;

class StaticBloc extends Bloc<StaticEvent, StaticState> {
  List? amountTotal;
  StaticBloc() : super(StaticInitial()) {
    on<CalculateDailyProfit>(getProfit);
  }

  FutureOr<void> getProfit(
      CalculateDailyProfit event, Emitter<StaticState> emit) async {
    try {
      final year = DateTime.now().year;
      final month = DateTime.now().month;
      final day = DateTime.now().day - 6;
      final profit = await supabase
          .from("invoice")
          .select("*, user!inner(type)")
          .match({"id_user": 2, "user.type": "provider"}).gte(
              "date", DateTime(year, month, day));
      amountTotal =
          await getAnalytics(profit: profit, amountTotal: amountTotal);
    } catch (e) {
      print(e.toString());
    }
  }

  getAnalytics({required List profit, required List? amountTotal}) {
    double amountSat = 0.0;
    double amountSun = 0.0;
    double amountMon = 0.0;
    double amountTue = 0.0;
    double amountWed = 0.0;
    double amountThu = 0.0;
    double amountFri = 0.0;
    double amountToday = 0.0;

    for (var element in profit) {
      if (DateFormat()
          .add_MEd()
          .format(DateTime.parse(element["date"]))
          .contains("Sun")) {
        amountSun += (element["amount"]);

        print(element);
      }
      if (DateFormat()
          .add_MEd()
          .format(DateTime.parse(element["date"]))
          .contains("Mon")) {
        amountMon += (element["amount"]);

        print(element);
      }
      if (DateFormat()
          .add_MEd()
          .format(DateTime.parse(element["date"]))
          .contains("Tue")) {
        amountTue += (element["amount"]);
        print(amountTue);
      }
      if (DateFormat()
          .add_MEd()
          .format(DateTime.parse(element["date"]))
          .contains("Wed")) {
        amountWed += (element["amount"]);

        print(element);
      }
      if (DateFormat()
          .add_MEd()
          .format(DateTime.parse(element["date"]))
          .contains("Thu")) {
        amountThu += (element["amount"]);

        print(element);
      }
      if (DateFormat()
          .add_MEd()
          .format(DateTime.parse(element["date"]))
          .contains("Fri")) {
        amountFri += (element["amount"]);
        print(element);
      }
      if (DateFormat()
          .add_MEd()
          .format(DateTime.parse(element["date"]))
          .contains("Sat")) {
        amountSat += (element["amount"]);
        print(element);
      }
      if (element["date"] == DateTime.now().toString().split(" ")[0]) {
        amountToday += (element["amount"]);
        print(element);
      }
    }

    return amountTotal = [
      amountSat,
      amountSun,
      amountMon,
      amountTue,
      amountWed,
      amountThu,
      amountFri,
      amountToday
    ];
  }
}
