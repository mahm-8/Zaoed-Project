part of 'provider_bloc.dart';

@immutable
sealed class ProviderEvent {}

class HoursSelectIndexEvent extends ProviderEvent {
  final int selectedIndex;
  HoursSelectIndexEvent(this.selectedIndex);
}

class ChargingTypeIndexSelectedEvent extends ProviderEvent {
  final bool selectedIndex;
  ChargingTypeIndexSelectedEvent(this.selectedIndex);
}

class ChargingTypeIncrementCountEvent extends ProviderEvent {
  final String name;
  ChargingTypeIncrementCountEvent({required this.name});
}

class ChargingTypeDecrementCountEvent extends ProviderEvent {
  final String name;
  ChargingTypeDecrementCountEvent({required this.name});
}

class GetProviderChargingPointsEvent extends ProviderEvent {}

class AddChargingPointEvent extends ProviderEvent {
  final String chargingPointName;
  final String arrivelHours;
  final double? longitude;
  final double? latitude;
  // getchargertype????
  // final int portCount;
  // final String chargingPortName;
  AddChargingPointEvent(
      this.chargingPointName, this.arrivelHours, this.longitude, this.latitude);
}

class EditChargingPointEvent extends ProviderEvent {
  final String chargingPointName;
  final String arrivelHours;
  final int? pointID;
  final int chargingCount;

  // ??
  // final String chargingType;

  EditChargingPointEvent(
      {required this.pointID,
      required this.arrivelHours,
      required this.chargingPointName,
      required this.chargingCount});
}

class DeleteChargingPointEvent extends ProviderEvent {
  final int? pointId;

  DeleteChargingPointEvent({required this.pointId});
}
