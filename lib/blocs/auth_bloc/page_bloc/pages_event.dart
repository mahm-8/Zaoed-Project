part of 'pages_bloc.dart';

abstract class PagesEvent {}

class PageNavigationEvent extends PagesEvent {
  final int pageSelected;

  PageNavigationEvent(this.pageSelected);
}

class PageOnboardingEvent extends PagesEvent {
  final int selected;

  PageOnboardingEvent(this.selected);
}

class PageTabBarLoginEvent extends PagesEvent {
  final int selected;

  PageTabBarLoginEvent(this.selected);
}class PageTabBarSignupEvent extends PagesEvent {
  final int selected;

  PageTabBarSignupEvent(this.selected);
}

class ChargingTimeEvent extends PagesEvent {
  final int selected;

  ChargingTimeEvent(this.selected);
}

class ChargingTypeEvent extends PagesEvent {
  final int selected;

  ChargingTypeEvent(this.selected);
}
