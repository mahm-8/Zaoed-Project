part of 'provider_bloc.dart';

@immutable
sealed class ProviderState {}

final class ProviderInitial extends ProviderState {}

final class LoadingState extends ProviderState {}

class ErrorState extends ProviderState {
  final String message;
  ErrorState({required this.message});
}

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

class GetChargingPointDetailsState extends ProviderState {}

class AddChargingPointState extends ProviderState {}

class EditChargingPointState extends ProviderState {}

class DeleteChargingPointState extends ProviderState {}
