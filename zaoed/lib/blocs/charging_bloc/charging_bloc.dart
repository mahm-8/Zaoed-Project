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
          print("ChargingStatus");
          emit(ChargingStatus());
        } else if (states.isEmpty) {
          print("EmptyBookingState");
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
    emit(ChargingFinishedStatus());
    await Future.delayed(const Duration(minutes: 1), () {
      add(EmptyCarsEvent());
    });
  }

  FutureOr<void> getBookedUser(
      GetUserBooking event, Emitter<ChargingState> emit) async {
    try {
      final id = supabase.auth.currentUser?.id;

      await supabase.from("cars_booking").select().eq('id_auth', id!);
      await Future.delayed(
        const Duration(minutes: 1),
      );

      emit(GetBookingStatus());
    } catch (e) {
      return;
    }
  }
}
