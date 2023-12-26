import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaoed/service/networking.dart';
import 'package:zaoed/static_method/static_hour.dart';

part 'static_event.dart';
part 'static_state.dart';

class StaticBloc extends Bloc<StaticEvent, StaticState> {
  List? dailyHour;
  StaticBloc() : super(StaticInitial()) {
    on<HourStaticEvent>(hourStatic);
  }
  FutureOr<void> hourStatic(
      HourStaticEvent event, Emitter<StaticState> emit) async {
    try {
      final year = DateTime.now().year;
      final month = DateTime.now().month;
      final day6 = DateTime.now().day - 6;

      final supabase = SupabaseNetworking().getSupabase;
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
      print(e);
    }
  }
}
