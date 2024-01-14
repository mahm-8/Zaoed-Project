part of '../finder_bloc/finder_bloc.dart';

@immutable
sealed class FinderState {}

final class FinderInitial extends FinderState {}

class LoadDataTimerState extends FinderState {}

class SuccessPayState extends FinderState {}

class ErrorPayState extends FinderState {}

class TimerDataState extends FinderState {
  final String formattedTime;
  final String remainingTime;
  final double completedPercentage;

  TimerDataState(
      this.formattedTime, this.remainingTime, this.completedPercentage);
}
class PrecentageState extends FinderState {
  final double completedPercentage;

  PrecentageState({required this.completedPercentage});
}
class InvoiceDataState extends FinderState {
  final List? invoice;

  InvoiceDataState({required this.invoice});
}
