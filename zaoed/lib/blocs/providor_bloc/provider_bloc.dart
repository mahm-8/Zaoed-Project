import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaoed/service/networking.dart';
import 'package:zaoed/constants/imports.dart';

part 'provider_event.dart';
part 'provider_state.dart';

class ProviderBloc extends Bloc<ProviderEvent, ProviderState> {
  ProviderBloc() : super(ProviderInitial()) {
    final supabase = SupabaseNetworking().getSupabase;
    final id = supabase.auth.currentUser?.id;

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
      try {
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

    // on<GetPointLangLatEvent>((event, emit) async {
    //   try {
    //     List locations;
    //     locations = await getLocationMethod();
    //     print("location List$locations");

    //     final longitude = locations[0]["longitude"];
    //     final latitude = locations[0]["latitude"];
    //     await Future.delayed(const Duration(seconds: 1));
    //     emit(GetChargingPointLocationState(lang: longitude, lat: latitude));
    //   } catch (e) {
    //     print(e.toString());
    //   }
    // });
  }

  getLocationMethod() async {
    try {
      final id = SupabaseNetworking().getSupabase.auth.currentUser?.id;

      List locationList = [];
      final locationData = await SupabaseNetworking()
          .getSupabase
          .from("charging_point")
          .select('longitude,latitude')
          .eq('id_auth', id!);
      // print("locatiiiion$locationData");
      for (var element in locationData) {
        locationList.add(element);
      }
      return locationList;
    } catch (e) {
      print(e.toString());
    }
  }
}
