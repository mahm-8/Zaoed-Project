part of 'cars_bloc.dart';

abstract class CarsState {}

final class CarsInitial extends CarsState {}

final class CarBrandState extends CarsState {
  final String brand;

  CarBrandState({required this.brand});
}

final class CarModelState extends CarsState {
  final String mdel;

  CarModelState({required this.mdel});
}

final class CarTypeState extends CarsState {
  final String type;

  CarTypeState({required this.type});
}

final class CarDataState extends CarsState {
  final List<CarModel>? cars;

  CarDataState(this.cars);
}
