import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaoed/service/networking.dart';

part 'provider_event.dart';
part 'provider_state.dart';

class ProviderBloc extends Bloc<ProviderEvent, ProviderState> {
  ProviderBloc() : super(ProviderInitial()) {
    int count = 0;

    on<HoursSelectIndexEvent>((event, emit) {
      emit(HoursIndexSelectedState(event.selectedIndex));
    });

    on<ChargingTypeIndexSelectedEvent>((event, emit) {
      emit(ChargingTypeIndexSelectedState(event.selectedIndex));
    });
    on<ChargingTypeIncrementCountEvent>((event, emit) {
      count++;
      emit(ChargingTypeCountUpdated(count));
    });
    on<ChargingTypeDecrementCountEvent>((event, emit) {
      if (count > 0) {
        count--;
      }
      emit(ChargingTypeCountUpdated(count));
    });
    on<AddChargingPointEvent>((event, emit) async {
      final supabase = SupabaseNetworking().getSupabase;
      try {
        final id = supabase.auth.currentUser?.id;

        await supabase.from("charging_point").insert({
          "point_name": event.chargingPointName,
          "longitude": event.longitude,
          "latitude": event.latitude,
          "charging_times": event.chargingTimes,
          'charging_port': event.chargingPortName,
          'port_count': event.portCount
        }).eq('id_auth', id!);
      } catch (e) {
        return;
      }
    });
  }
}
