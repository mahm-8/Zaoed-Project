part of 'provider_bloc.dart';

@immutable
sealed class ProviderState {}

final class ProviderInitial extends ProviderState {}

class HoursIndexSelectedState extends ProviderState {
  final int selectedIndex;
  HoursIndexSelectedState(this.selectedIndex);
}

class ChargingTypeIndexSelectedState extends ProviderState {
  final bool selectedIndex;
  ChargingTypeIndexSelectedState(this.selectedIndex);
}

class ChargingTypeCountUpdated extends ProviderState {
  final int count;

  ChargingTypeCountUpdated(this.count);
}
