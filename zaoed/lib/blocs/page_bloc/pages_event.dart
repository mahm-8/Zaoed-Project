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
class PageTabBarEvent extends PagesEvent {
  final int selected;

  PageTabBarEvent(this.selected);
}
