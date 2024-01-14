import 'package:zaoed/constants/imports.dart';

part 'static_event.dart';
part 'static_state.dart';

final supabase = SupabaseNetworking().getSupabase;

class StaticBloc extends Bloc<StaticEvent, StaticState> {
  List? dailyHour;
  List? amountTotal;

  StaticBloc() : super(StaticInitial()) {
    on<HourStaticEvent>(hourStatic);
    on<CalculateDailyProfit>(getProfit);
  }
  FutureOr<void> hourStatic(
      HourStaticEvent event, Emitter<StaticState> emit) async {
    try {
      final year = DateTime.now().year;
      final month = DateTime.now().month;
      final day6 = DateTime.now().day - 6;

      final id = supabase.auth.currentUser!.id;
      final staticdata = await supabase
          .from('cars_booking')
          .select(''' hours,created_at ''')
          .gte("created_at", DateTime(year, month, day6))
          .eq('id_povider', id);

      dailyHour = await StaticDaily()
          .totalHour(staticData: staticdata, dailyHour: dailyHour);
      emit(StaticHourState(totalToday: dailyHour?[7] ?? 0));
    } catch (e) {
      return;
    }
  }

  FutureOr<void> getProfit(
      CalculateDailyProfit event, Emitter<StaticState> emit) async {
    try {
      final year = DateTime.now().year;
      final month = DateTime.now().month;
      final day = DateTime.now().day - 6;
      final id = supabase.auth.currentUser!.id;
      final profit = await supabase
          .from("invoice")
          .select("*, charging_point!inner(*)")
          .match({"charging_point.id_auth": id}).gte(
              "created_at", DateTime(year, month, day));
      amountTotal = await StaticDaily()
          .getAnalytics(profit: profit, amountTotal: amountTotal);
      emit(StaticAmountState(totalToday: amountTotal?[7]));
    } catch (e) {
      return;
    }
  }
}
