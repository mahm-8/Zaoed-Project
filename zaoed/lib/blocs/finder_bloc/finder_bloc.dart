import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:zaoed/service/networking.dart';
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
      final response = await supabase
              .from('cars_booking')
              .select('hours') // .eq('id_auth', id!)
          ;
      final data = response.first;
      staticRemainingTimeHour = int.parse(data['hours']) * 60;
      remainingTimeHour = staticRemainingTimeHour;
      print("here i am");
      add(TimerEvent());
      emit(LoadDataTimerState());
      myController.sink.add("event");
    });
    on<TimerEvent>((event, emit) async {
      try {
        formattedTime = timeFormat(remainingTimeHour);
      } catch (e) {
        print(e.toString());
      }
    });
    myStream = myController.stream;
    myStream?.listen((event) {
      print("Dddddd");
      emit(TimerDataState(
          formattedTime, timeFormat(remainingTimeHour), completedPercentage));
    });
    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      timeFormat(remainingTimeHour.toInt());
      if (remainingTimeHour > 0 && completedPercentage < 100) {
        print(remainingTimeHour);
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
