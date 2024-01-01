import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../service/networking.dart';

part 'charging_event.dart';
part 'charging_state.dart';

class ChargingBloc extends Bloc<ChargingEvent, ChargingState> {
  ChargingBloc() : super(ChargingInitial()) {
    on<EmptyCarsEvent>(emptyCar);
    on<CompleteCarsEvent>(completeCar);
  }

  FutureOr<void> emptyCar(
      EmptyCarsEvent event, Emitter<ChargingState> emit) async {
    try {
      final supabase = SupabaseNetworking().getSupabase;
      final id = supabase.auth.currentUser?.id;

      final cars = await supabase.from("cars").select().eq("id_user", id!);
      if (cars.isNotEmpty) {
        final states = await supabase
            .from("cars_booking")
            .select()
            .match({'id_auth': id, "status": "progress"});
        await Future.delayed(const Duration(seconds: 1));
        print("ssssssssssssssssssssssssssssssssssssssssssssssssssss");
        print(states);
        if (states.isNotEmpty) {
          print("jjjjjjjjjjjjjjjjj");
          emit(ChargingStatus());
        } else if (states.isEmpty) {
          print("2222222222222222222222");
          emit(EmptyBookingState());
        }
      } else {
        emit(EmptyCarState());
      }
    } catch (error) {
      print("crach $error");
    }
  }

  FutureOr<void> completeCar(
      CompleteCarsEvent event, Emitter<ChargingState> emit) async {
    emit(ChargingFinishedStatus());
    await Future.delayed(const Duration(minutes: 1));
    add(EmptyCarsEvent());
  }
}
