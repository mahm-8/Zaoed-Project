import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
part 'pages_event.dart';
part 'pages_state.dart';

class PagesBloc extends Bloc<PagesEvent, PagesState> {
  PagesBloc() : super(PagesInitial()) {
    on<PageNavigationEvent>(navigationSelect);
    on<PageOnboardingEvent>(onboardinSelect);
  }

  FutureOr<void> navigationSelect(
      PageNavigationEvent event, Emitter<PagesState> emit) {
    emit(PagesNavigationState(event.pageSelected));
  }

  FutureOr<void> onboardinSelect(
      PageOnboardingEvent event, Emitter<PagesState> emit) {
    emit(PageOnboardingState(event.selected));
  }
}
