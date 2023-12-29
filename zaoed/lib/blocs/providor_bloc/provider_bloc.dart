import 'package:zaoed/constants/imports.dart';
part 'provider_event.dart';
part 'provider_state.dart';

class ProviderBloc extends Bloc<ProviderEvent, ProviderState> {
  int count1 = 0;
  int count2 = 0;
  int count3 = 0;
  int count4 = 0;
  int count5 = 0;
  int count6 = 0;
  int count7 = 0;

  ProviderBloc() : super(ProviderInitial()) {
    on<HoursSelectIndexEvent>((event, emit) {
      emit(HoursIndexSelectedState(event.selectedIndex));
    });

    on<ChargingTypeIndexSelectedEvent>((event, emit) {
      emit(ChargingTypeIndexSelectedState(event.selectedIndex));
    });
    on<ChargingTypeIncrementCountEvent>((event, emit) {
      if (event.name == "count1") {
        count1++;
        emit(ChargingTypeCountUpdated(count1));
      } else if (event.name == "count2") {
        count2++;
        emit(ChargingTypeCountUpdated(count2));
      } else if (event.name == "count3") {
        count3++;
        emit(ChargingTypeCountUpdated(count3));
      } else if (event.name == "count4") {
        count4++;
        emit(ChargingTypeCountUpdated(count4));
      } else if (event.name == "count5") {
        count5++;
        emit(ChargingTypeCountUpdated(count5));
      } else if (event.name == "count6") {
        count6++;
        emit(ChargingTypeCountUpdated(count6));
      } else if (event.name == "count7") {
        count7++;
        emit(ChargingTypeCountUpdated(count7));
      }
    });
    on<ChargingTypeDecrementCountEvent>((event, emit) {
      if (count1 > 0 && event.name == "count1") {
        count1--;
        emit(ChargingTypeCountUpdated(count1));
      } else if (count2 > 0 && event.name == "count2") {
        count2--;
        emit(ChargingTypeCountUpdated(count2));
      } else if (count3 > 0 && event.name == "count3") {
        count3--;
        emit(ChargingTypeCountUpdated(count3));
      } else if (count4 > 0 && event.name == "count4") {
        count4--;
        emit(ChargingTypeCountUpdated(count4));
      } else if (count5 > 0 && event.name == "count5") {
        count5--;
        emit(ChargingTypeCountUpdated(count5));
      } else if (count6 > 0 && event.name == "count6") {
        count6--;
        emit(ChargingTypeCountUpdated(count6));
      } else if (count7 > 0 && event.name == "count7") {
        count7--;
        emit(ChargingTypeCountUpdated(count7));
      }
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
