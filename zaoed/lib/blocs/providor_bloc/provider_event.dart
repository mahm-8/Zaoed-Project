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

class ChargingTypeIncrementCountEvent extends ProviderEvent {}

class ChargingTypeDecrementCountEvent extends ProviderEvent {}
