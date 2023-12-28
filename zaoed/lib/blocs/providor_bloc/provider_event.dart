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

class AddChargingPointEvent extends ProviderEvent {
  final String chargingPointName;
  final String chargingTimes;
  final double longitude;
  final double latitude;
  final int portCount;
  final String chargingPortName;
  AddChargingPointEvent(this.chargingPointName, this.chargingTimes,
      this.longitude, this.latitude, this.portCount, this.chargingPortName);
}

// class GetPointLangLatEvent extends ProviderEvent {}
