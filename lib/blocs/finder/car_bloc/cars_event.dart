part of 'cars_bloc.dart';

abstract class CarsEvent {}

class SelectCarDeteilsEvent extends CarsEvent {
  final String select;

  SelectCarDeteilsEvent({required this.select});
}

class AddcarEvent extends CarsEvent {
  final String brand;
  final String model;
  final String type;

  AddcarEvent({required this.brand, required this.model, required this.type});
}

class CarsDataEvent extends CarsEvent {}
