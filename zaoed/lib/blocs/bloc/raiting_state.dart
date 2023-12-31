part of 'raiting_bloc.dart';

@immutable
sealed class RaitingState {}

final class RaitingInitial extends RaitingState {}

final class UpdateRateState extends RaitingState {
  final double rate;

  UpdateRateState({required this.rate});
}final class GetRateState extends RaitingState {
  final List allRate;

  GetRateState({required this.allRate});
}
