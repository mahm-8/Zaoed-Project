import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../service/networking.dart';

part 'charging_event.dart';
part 'charging_state.dart';

class ChargingBloc extends Bloc<ChargingEvent, ChargingState> {
  ChargingBloc() : super(ChargingInitial()) {
    on<EmptyCarsEvent>(emptyCar);
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

        if (states.isNotEmpty) {
          print("انا");
          emit(ChargingStatus());
        } else {
          print("2");
          emit(EmptyBookingState());
        }
      } else {
        emit(EmptyCarState());
      }
    } catch (error) {}
  }
}
