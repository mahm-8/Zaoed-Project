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
        if (states.isNotEmpty) {
          emit(ChargingStatus());
        } else if (states.isEmpty) {
          emit(EmptyBookingState());
        }
      } else {
        emit(EmptyCarState());
      }
    } catch (error) {
      return;
    }
  }

  FutureOr<void> completeCar(
      CompleteCarsEvent event, Emitter<ChargingState> emit) async {
    print("1");
    emit(ChargingFinishedStatus());
    await Future.delayed(const Duration(minutes: 1), () {
      add(EmptyCarsEvent());
      print("2state");
    });
    print("3state");
  }
}
