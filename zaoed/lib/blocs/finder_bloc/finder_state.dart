part of '../finder_bloc/finder_bloc.dart';

@immutable
sealed class FinderState {}

final class FinderInitial extends FinderState {}
class LoadDataTimerState extends FinderState {}

class TimerDataState extends FinderState {
  final String formattedTime;
  final String remainingTime;
  final double completedPercentage;

  TimerDataState(
      this.formattedTime, this.remainingTime, this.completedPercentage);
}
