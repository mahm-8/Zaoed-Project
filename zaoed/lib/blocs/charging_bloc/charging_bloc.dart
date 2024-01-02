import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaoed/blocs/providor_bloc/static_bloc/static_bloc.dart';
import 'package:zaoed/constants/imports.dart';

part 'charging_event.dart';
part 'charging_state.dart';

class ChargingBloc extends Bloc<ChargingEvent, ChargingState> {
  ChargingBloc() : super(ChargingInitial()) {
    on<EmptyCarsEvent>(emptyCar);
    on<CompleteCarsEvent>(completeCar);
    on<GetUserBooking>(getBookedUser);
  }

  FutureOr<void> emptyCar(
      EmptyCarsEvent event, Emitter<ChargingState> emit) async {
    try {
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

  FutureOr<void> getBookedUser(
      GetUserBooking event, Emitter<ChargingState> emit) async {
    try {
      final id = supabase.auth.currentUser?.id;

      final userBooked =
          await supabase.from("cars_booking").select().eq('id_auth', id!);
      await Future.delayed(
        const Duration(minutes: 1),
      );

      print("lllllllllllllllllllllll");
      print("lllllllllllllllllllllll");
      print("lllllllllllllllllllllll");

      print(userBooked);

      print("lllllllllllllllllllllll");
      print("lllllllllllllllllllllll");
      print("lllllllllllllllllllllll");
      emit(GetBookingStatus());
    } catch (e) {
      print(e.toString());
      print(e.toString());
    }
  }
}
