// ignore_for_file: depend_on_referenced_packages, void_checks

import 'package:zaoed/constants/imports.dart';

export 'dart:async';
part 'actions_event.dart';
part 'actions_state.dart';

class ActionsBloc extends Bloc<ActionsEvent, ActionsState> {
  List<BookmarkModel>? bookmarkData;
  List<ChargingPoint>? chargingPointData;
  int chrgerCoice = 0;
  double? price = 9;
  String? capon;
  late QRViewController scanController;
  List<String> chargerTypes = [
    'GB/T AC',
    'Type2',
    'Tesla',
    'Type1',
    'GB/T DC',
    'CCS 2',
    'chademo',
    'CCS 1'
  ];
  List<String> chargerImageUrl = [
    'lib/assets/icons/GB.png',
    'lib/assets/icons/Type 2.png',
    'lib/assets/icons/Tesla.png',
    'lib/assets/icons/Type 1.png',
    'lib/assets/icons/T DC.png',
    'lib/assets/icons/CCS 2.png',
    'lib/assets/icons/Chademo.png',
    'lib/assets/icons/CCS 1.png'
  ];
  List<String> chargingSpeed = [
    "سرعة الشحن (>kw 3.7)",
    "شبه سريعة (3.7 - 20 kw>)",
    "سريعة (20 - 43 kw>)",
    "فائقة السرعة (43 kw<)"
  ];
  List<String> choices = [
    "كل الخيارات",
    "نجمة فأقل ",
    "نجمتين فأقل",
    "ثلاثة فأقل",
    "أربعة فأقل",
    "خمسة نجوم",
  ];

  List<String> starimageUrl = [
    "lib/assets/icons/all_rating.png",
    "lib/assets/icons/one_star.png",
    "lib/assets/icons/two_star.png",
    "lib/assets/icons/three_star.png",
    "lib/assets/icons/four_star.png",
    "lib/assets/icons/five_star.png"
  ];

  List<bool> chargingSpeedFilters = [false, false, false, false];
  List<bool> starFilters = [false, false, false, false, false, false];

  ActionsBloc() : super(ActionsInitial()) {
    on<GetBookmarkEvent>(getBookmarkMethod);
    on<AddBookmarkEvent>(addBookmarkMethod);
    on<DeleteBookmarkEvent>(deleteBookmarkMethod);
    on<GetChargingPointsEvent>(getChargingPointsMethod);
    on<FilterChargerSelectionEvent>(chooseChargerMethod);
    on<ChargingSpeedFilterEvent>(checkboxChargingSpeed);
    on<StarFilterEvent>(checkboxStar);

    on<CaponEvent>((event, emit) {
      if (capon == 'Zaoed') {
        price = price! - (price! * 0.25);
        return price;
      }
      emit(CaponState());
    });
  }

  FutureOr<void> getChargingPointsMethod(
      GetChargingPointsEvent event, Emitter<ActionsState> emit) async {
    try {
      chargingPointData = await ActionSupabaseMethods().getChargingPoint();

      emit(GetChargingPointsState(chargingPoints: chargingPointData!));
    } catch (e) {
      ErrorState();
    }
  }

  FutureOr<void> getBookmarkMethod(
      GetBookmarkEvent event, Emitter<ActionsState> emit) async {
    try {
      bookmarkData = await ActionSupabaseMethods().getBookmarks();
      await Future.delayed(const Duration(seconds: 1));
      emit(GetBookmarkState(bookmarks: bookmarkData!));
    } catch (e) {
      ErrorState();
    }
  }

  FutureOr<void> addBookmarkMethod(
      AddBookmarkEvent event, Emitter<ActionsState> emit) async {
    try {
      await ActionSupabaseMethods().addBookmark(pointID: event.pointID);

      emit(AddBookmarkState(isBookmarked: true));

      add(GetBookmarkEvent());
      emit(LoadingState());
    } catch (e) {
      emit(ErrorState());
    }
  }

  FutureOr<void> deleteBookmarkMethod(
      DeleteBookmarkEvent event, Emitter<ActionsState> emit) async {
    try {
      await ActionSupabaseMethods().deleteBookmark(id: event.bookmarkID);

      emit(DeleteBookmarkState(isBookmarked: false));
      add(GetBookmarkEvent());
      emit(LoadingState());
    } catch (e) {
      emit(ErrorState());
    }
  }

  FutureOr<void> checkboxChargingSpeed(
      ChargingSpeedFilterEvent event, Emitter<ActionsState> emit) {
    chargingSpeedFilters[event.index] = event.value;
    emit(FilterChargingSpeedState());
  }

  FutureOr<void> checkboxStar(
      StarFilterEvent event, Emitter<ActionsState> emit) {
    starFilters[event.index] = event.value;
    emit(FilterStarState());
  }

  FutureOr<void> chooseChargerMethod(
      FilterChargerSelectionEvent event, Emitter<ActionsState> emit) {
    chrgerCoice = event.index;
    emit(ChargerFilterState(selected: event.index));
  }
}
