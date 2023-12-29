part of 'charging_bloc.dart';

@immutable
abstract class ChargingEvent {}

class StatusCarsEvent extends ChargingEvent {}

class EmptyCarsEvent extends ChargingEvent {}

class NonCarsEvent extends ChargingEvent {}

class CompleteCarsEvent extends ChargingEvent {}
