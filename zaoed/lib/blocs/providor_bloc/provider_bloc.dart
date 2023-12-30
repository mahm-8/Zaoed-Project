import 'package:zaoed/blocs/actions_bloc/action_methods.dart';
import 'package:zaoed/blocs/providor_bloc/static_bloc/static_bloc.dart';
import 'package:zaoed/constants/imports.dart';
part 'provider_event.dart';
part 'provider_state.dart';

class ProviderBloc extends Bloc<ProviderEvent, ProviderState> {
  List<ChargingPoint>? providerPointsData;
  int count1 = 0;
  int count2 = 0;
  int count3 = 0;
  int count4 = 0;
  int count5 = 0;
  int count6 = 0;
  int count7 = 0;
  String selectedHour = "";

  String? pointName;

  double? pinLatitude;
  double? pinLongitude;
  List<Map<String, dynamic>> countersList = [];

  List port_type = [
    'GB/T AC',
    'Type2',
    'Tesla',
    'Type1',
    'CCS 1',
    'CCS 2',
    'Chademo'
  ];
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

      if (count1 != 0) {
        countersList.add({"number_of_port": count1, "port_name": port_type[0]});
      } else if (count2 != 0) {
        countersList.add({"number_of_port": count2, "port_name": port_type[1]});
      } else if (count3 != 0) {
        countersList.add({"number_of_port": count3, "port_name": port_type[2]});
      } else if (count4 != 0) {
        countersList.add({"number_of_port": count4, "port_name": port_type[3]});
      } else if (count5 != 0) {
        countersList.add({"number_of_port": count5, "port_name": port_type[4]});
      } else if (count6 != 0) {
        countersList.add({"number_of_port": count6, "port_name": port_type[5]});
      } else if (count7 != 0) {
        countersList.add({"number_of_port": count7, "port_name": port_type[6]});
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

    on<GetProviderChargingPointsEvent>((event, emit) async {
      try {
        providerPointsData =
            await ActionSupabaseMethods().getProviderChargingPoints();
        await Future.delayed(const Duration(seconds: 1));
        emit(GetProviderChargingPointsState(
            providerChargingPoints: providerPointsData!));
        print("providerPointsData,,,,,,,,,,,,,,");
        print(providerPointsData);
      } catch (e) {
        ErrorState(message: e.toString());
      }
    });
    on<AddChargingPointEvent>((event, emit) async {
      try {
        final id = supabase.auth.currentUser?.id;
        final chargingPoint = await supabase
            .from("charging_point")
            .insert({
              "point_name": event.chargingPointName,
              "longitude": pinLongitude,
              "latitude": pinLatitude,
              "arrivel_hour": event.arrivelHours,
              'id_auth': id,
            })
            .select()
            .single();
        emit(AddChargingPointState());
        print(countersList);
        List<Map<String, dynamic>> theList = [];
        for (var element in countersList) {
          Map<String, dynamic> updateElements = {...element};
          updateElements
              .addAll({"id_charging_point": chargingPoint["point_id"]});
          theList.add(updateElements);
        }

        print("--------------theList");

        print(theList);
        await supabase.from('port_counter').insert(theList);
        emit(AddChargingPointState());
      } catch (e) {
        print(e.toString());
        return;
      }
    });

    on<EditChargingPointEvent>((event, emit) async {
      try {
        //
        final id = supabase.auth.currentUser?.id;
        final chargingPoint = await supabase
            .from("charging_point")
            .update({
              "point_name": event.chargingPointName,
              'id_auth': id,
            })
            .select()
            .single();

        pointName = chargingPoint['point_name'];
        print(pointName);
        List<Map<String, dynamic>> theList = [];
        for (var element in countersList) {
          Map<String, dynamic> updateElements = {...element};
          updateElements
              .addAll({"id_charging_point": chargingPoint["point_id"]});
          theList.add(updateElements);
          // event.chargingCount how to get
        }
        print(theList);
        await supabase.from('port_counter').insert(theList);
        emit(AddChargingPointState());
      } catch (e) {
        print(e.toString());
        return;
      }
    });

    on<DeleteChargingPointEvent>((event, emit) async {
      try {
        await ActionSupabaseMethods().deleteChargingPoint(id: event.pointId);
        emit(DeleteChargingPointState());
        add(GetProviderChargingPointsEvent());
      } catch (e) {
        emit(ErrorState(message: 'لم يتم الحذف'));
      }
    });


  }
}
