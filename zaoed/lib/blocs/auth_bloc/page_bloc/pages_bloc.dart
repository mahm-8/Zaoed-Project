import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'pages_event.dart';
part 'pages_state.dart';

class PagesBloc extends Bloc<PagesEvent, PagesState> {
  int typePort = 0;
  int hourCharg = 0;
  PagesBloc() : super(PagesInitial()) {
    on<PageNavigationEvent>(navigationSelect);
    on<PageOnboardingEvent>(onboardinSelect);
    on<PageTabBarLoginEvent>(tabBarSelect);
    on<ChargingTimeEvent>(chargingTime);
    on<ChargingTypeEvent>(chargingType);
    on<PageTabBarSignupEvent>(selectTabSignup);
  }

  FutureOr<void> navigationSelect(
      PageNavigationEvent event, Emitter<PagesState> emit) {
    emit(PagesNavigationState(event.pageSelected));
  }

  FutureOr<void> onboardinSelect(
      PageOnboardingEvent event, Emitter<PagesState> emit) {
    emit(PageOnboardingState(event.selected));
  }

  FutureOr<void> tabBarSelect(
      PageTabBarLoginEvent event, Emitter<PagesState> emit) {
    emit(PageTapBarState(event.selected));
  }

  FutureOr<void> chargingTime(
      ChargingTimeEvent event, Emitter<PagesState> emit) {
    hourCharg = event.selected;
    emit(ChargingTimeState(event.selected));
  }

  FutureOr<void> chargingType(
      ChargingTypeEvent event, Emitter<PagesState> emit) {
    typePort = event.selected;
    emit(ChargingTypeState(event.selected));
  }

  FutureOr<void> selectTabSignup(
      PageTabBarSignupEvent event, Emitter<PagesState> emit) {
    emit(SelectTapSignState(event.selected));
  }
}
