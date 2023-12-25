part of 'pages_bloc.dart';

abstract class PagesState {}

final class PagesInitial extends PagesState {}

final class PagesNavigationState extends PagesState {
  final int seleted;

  PagesNavigationState(this.seleted);
}

class PageOnboardingState extends PagesState {
  final int selected;

  PageOnboardingState(this.selected);
}
class PageTapBarState extends PagesState {
  final int selected;

  PageTapBarState(this.selected);
}
class ChargingTimeState extends PagesState {
  final int selected;

  ChargingTimeState(this.selected);
}
class ChargingTypeState extends PagesState {
  final int selected;

  ChargingTypeState(this.selected);
}