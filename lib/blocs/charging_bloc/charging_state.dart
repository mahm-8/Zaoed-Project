part of 'charging_bloc.dart';

@immutable
abstract class ChargingState {}

class ChargingInitial extends ChargingState {}

class EmptyCarState extends ChargingState {}

class EmptyBookingState extends ChargingState {}

class ChargingStatus extends ChargingState {}

class ChargingFinishedStatus extends ChargingState {}

class GetBookingStatus extends ChargingState {}
