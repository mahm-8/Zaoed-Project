part of '../finder_bloc/finder_bloc.dart';

@immutable
sealed class FinderEvent {}

class LoadDataTimerEvent extends FinderEvent {}

class TimerEvent extends FinderEvent {}
