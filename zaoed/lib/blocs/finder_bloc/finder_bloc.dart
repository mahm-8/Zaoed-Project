// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:zaoed/constants/imports.dart';
import 'package:intl/intl.dart';
part 'finder_event.dart';
part 'finder_state.dart';

class FinderBloc extends Bloc<FinderEvent, FinderState> {
  StreamController myController = StreamController();
  Stream? myStream;
  late int staticRemainingTimeHour = 0;
  late int remainingTimeHour = 0;
  late double labelHours = 0;
  double completedPercentage = 0;
  late Timer timer;
  late String formattedTime;

  FinderBloc() : super(FinderInitial()) {
    on<LoadDataTimerEvent>((event, emit) async {
      final supabase = SupabaseNetworking().getSupabase;
      final id = supabase.auth.currentUser?.id;
      try {
        final response = await supabase
                .from('cars_booking')
                .select('hours')
                .eq('id_povider', id!) // .eq('id_auth', id!)
            ;
        final data = response.first;
        staticRemainingTimeHour = int.parse(data['hours']) * 60;
        remainingTimeHour = staticRemainingTimeHour;
        add(TimerEvent());
        emit(LoadDataTimerState());
        myController.sink.add("event");
      } catch (e) {
        return;
      }
    });
    on<TimerEvent>((event, emit) async {
      try {
        formattedTime = timeFormat(remainingTimeHour);
      } catch (e) {
        return;
      }
    });
    myStream = myController.stream;
    myStream?.listen((event) {
      emit(TimerDataState(
          formattedTime, timeFormat(remainingTimeHour), completedPercentage));
    });
    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      timeFormat(remainingTimeHour.toInt());
      if (remainingTimeHour > 0 && completedPercentage < 100) {
        remainingTimeHour -= 1;
        // completedPercentage += 0.1;
        completedPercentage = ((staticRemainingTimeHour - remainingTimeHour) /
                staticRemainingTimeHour) *
            100;

        myController.sink.add("event");
      }
    });
  }
  String timeFormat(remainingHours) {
    final hours = Duration(minutes: remainingHours);
    final formattedTime = DateFormat('HH:mm').format(DateTime(0).add(hours));
    return formattedTime;
  }
}
