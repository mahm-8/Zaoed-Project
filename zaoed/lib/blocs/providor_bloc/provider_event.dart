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

class GetChargingPointEvent extends ProviderEvent {}

class AddChargingPointEvent extends ProviderEvent {
  final String chargingPointName;
  final String chargingTimes;
  final double? longitude;
  final double? latitude;
  // getchargertype????
  // final int portCount;
  // final String chargingPortName;
  AddChargingPointEvent(this.chargingPointName, this.chargingTimes,
      this.longitude, this.latitude);
}

class EditChargingPointEvent extends ProviderEvent {
  final String chargingPointName;
  final String chargingTimes;

  EditChargingPointEvent(
      {required this.chargingPointName, required this.chargingTimes});
}

class DeleteChargingPointEvent extends ProviderEvent {
  final int? pointId;

  DeleteChargingPointEvent({required this.pointId});
}
