import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaoed/service/networking.dart';
import 'package:zaoed/constants/imports.dart';
part 'provider_event.dart';
part 'provider_state.dart';

class ProviderBloc extends Bloc<ProviderEvent, ProviderState> {
<<<<<<< HEAD
  ProviderBloc() : super(ProviderInitial()) {
    final supabase = SupabaseNetworking().getSupabase;
    final id = supabase.auth.currentUser?.id;

    int count = 0;
=======
  int count1 = 0;
  int count2 = 0;
  int count3 = 0;
  int count4 = 0;
  int count5 = 0;
  int count6 = 0;
  int count7 = 0;
>>>>>>> ebea0ee3f4d86bb031aa7dc7e811458ea4f7234a

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
      try {
<<<<<<< HEAD
=======
        final id = supabase.auth.currentUser?.id;
>>>>>>> ebea0ee3f4d86bb031aa7dc7e811458ea4f7234a
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
