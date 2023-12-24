import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:zaoed/service/networking.dart';

part 'cars_event.dart';
part 'cars_state.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  final List<String> listBrand = <String>[
    'تيسلا',
    'شيفروليه بولت',
    'نيسان ليف',
    'بي ام دبليو أي3'
  ];
  final List<String> listModel = <String>['موديل 3', 'موديل اس', 'موديل اكس'];
  final List<String> listType = <String>['Chademo', 'CCS 1', 'CCS 2'];
  late String brand;
  late String model;
  late String type;
  CarsBloc() : super(CarsInitial()) {
    on<SelectCarDeteilsEvent>(brandMethod);
    on<AddcarEvent>(addCar);
  }

  FutureOr<void> brandMethod(
      SelectCarDeteilsEvent event, Emitter<CarsState> emit) {
    if (listBrand.contains(event.select)) {
      brand = event.select;
      emit(CarBrandState(brand: event.select));
    }
    if (listModel.contains(event.select)) {
      model = event.select;
      emit(CarModelState(mdel: event.select));
    }
    if (listType.contains(event.select)) {
      type = event.select;
      emit(CarTypeState(type: event.select));
    }
  }

  FutureOr<void> addCar(AddcarEvent event, Emitter<CarsState> emit) async {
    final supabase = SupabaseNetworking().getSupabase;
    try {
      final id = supabase.auth.currentUser?.id;
      if(brand.isNotEmpty&&model.isNotEmpty&&type.isNotEmpty) {
        await supabase.from("cars").insert(
          {"brand": brand, "model": model, "type": type, "id_user": id});
      }
    } catch (e) {
      print(e);
    }
  }
}
