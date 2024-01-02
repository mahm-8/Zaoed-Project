part of 'raiting_bloc.dart';

@immutable
sealed class RaitingEvent {}

class UpdateRateEvent extends RaitingEvent {
  final double rate;

  UpdateRateEvent({required this.rate});
}

class SaveRateEvent extends RaitingEvent {
  final double rate;
  final String comment;

  SaveRateEvent({required this.rate, required this.comment});
}
