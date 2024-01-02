part of 'charging_bloc.dart';

@immutable
abstract class ChargingEvent {}

class StatusCarsEvent extends ChargingEvent {}

class EmptyCarsEvent extends ChargingEvent {
  final double? precent;

  EmptyCarsEvent({this.precent});
}

class NonCarsEvent extends ChargingEvent {}

class CompleteCarsEvent extends ChargingEvent {}

class GetUserBooking extends ChargingEvent {}
