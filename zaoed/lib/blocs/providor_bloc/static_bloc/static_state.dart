part of 'static_bloc.dart';

@immutable
sealed class StaticState {}

final class StaticInitial extends StaticState {}

final class StaticHourState extends StaticState {
  final int totalToday;

  StaticHourState({required this.totalToday});
}
