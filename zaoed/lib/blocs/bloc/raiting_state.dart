part of 'raiting_bloc.dart';

@immutable
sealed class RaitingState {}

final class RaitingInitial extends RaitingState {}

final class UpdateRateState extends RaitingState {
  final double rate;

  UpdateRateState({required this.rate});
}
