import 'package:zaoed/blocs/actions_bloc/action_methods.dart';
import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/blocs/providor_bloc/static_bloc/static_bloc.dart';
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
  List<String> textClock = [
    'غير متوفر',
    '00:00-6:00',
    '6:00-12:00',
    '12:00-18:00',
    '18:00-00:00'
  ];
  int currentCount = 0;

  ProviderBloc() : super(ProviderInitial()) {
    on<HoursSelectIndexEvent>((event, emit) {
      emit(HoursIndexSelectedState(event.selectedIndex));
    });

    on<ChargingTypeIndexSelectedEvent>((event, emit) {
      emit(ChargingTypeIndexSelectedState(event.selectedIndex));
    });
    on<ChargingTypeIncrementCountEvent>((event, emit) {
      int index = int.parse(
          event.name.substring(5)); // Extract the index from the event name

      switch (index) {
        case 1:
          currentCount = ++count1;
          break;
        case 2:
          currentCount = ++count2;
          break;
        case 3:
          currentCount = ++count3;
          break;
        case 4:
          currentCount = ++count4;
          break;
        case 5:
          currentCount = ++count5;
          break;
        case 6:
          currentCount = ++count6;
          break;
        case 7:
          currentCount = ++count7;
          break;
      }

      emit(ChargingTypeCountUpdated(currentCount));

      if (currentCount > 0) {
        countersList.add({
          "number_of_port": currentCount,
          "port_name": port_type[index - 1]
        });
      }
    });
    on<ChargingTypeDecrementCountEvent>((event, emit) {
      int index = int.parse(event.name.substring(5));

      if (currentCount > 0) {
        switch (index) {
          case 1:
            currentCount = --count1;
            break;
          case 2:
            currentCount = --count2;
            break;
          case 3:
            currentCount = --count3;
            break;
          case 4:
            currentCount = --count4;
            break;
          case 5:
            currentCount = --count5;
            break;
          case 6:
            currentCount = --count6;
            break;
          case 7:
            currentCount = --count7;
            break;
        }
      }
      ;
      emit(ChargingTypeCountUpdated(currentCount));
    });

    on<GetProviderChargingPointsEvent>((event, emit) async {
      try {
        emit(ProviderLoadingState());
        final providerPointsData =
            await ActionSupabaseMethods().getProviderChargingPoints();
        await Future.delayed(const Duration(seconds: 1));
        emit(GetProviderChargingPointsState(
            providerChargingPoints: providerPointsData));
      } catch (e) {
        print("Errror: GetProviderChargingPointsEvent BLOC");
        print(e.toString());
        return;
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
        print(countersList);
        List<Map<String, dynamic>> theList = [];
        for (var element in countersList) {
          Map<String, dynamic> updateElements = {...element};

          updateElements
              .addAll({"id_charging_point": chargingPoint["point_id"]});
          theList.add(updateElements);
          print("updateElements");

          print(updateElements);
        }

        print("--------------theList");
        await supabase.from('port_counter').insert(theList);
        ActionsBloc().add(GetChargingPointsEvent());
        emit(AddChargingPointState());
        count1 = 0;
        count2 = 0;
        count3 = 0;
        count4 = 0;
        count5 = 0;
        count6 = 0;
        count7 = 0;
        countersList = [];
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
              "arrivel_hour": event.arrivelHours,
            })
            .match({'id_auth': id!, "point_id": event.pointID})
            .select()
            .single();

        List<Map<String, dynamic>> theList = [];
        for (var element in countersList) {
          Map<String, dynamic> updateElements = {...element};
          updateElements
              .addAll({"id_charging_point": chargingPoint["point_id"]});
          theList.add(updateElements);
          // event.chargingCount how to get
        }
        await supabase.from('port_counter').insert(theList);
        print("chargingPoint--------------------------------ppp");

        // print(chargingPoint);
        print("theList--------------------------------ppp");

        // print(theList);

        emit(EditChargingPointState());
        add(GetProviderChargingPointsEvent());
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
        print(e.toString());
      }
    });
  }
}
