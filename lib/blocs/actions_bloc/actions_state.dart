part of 'actions_bloc.dart';

class ActionsState {}

final class ActionsInitial extends ActionsState {}

final class GetBookmarkState extends ActionsState {
  final List<BookmarkModel> bookmarks;

  GetBookmarkState({required this.bookmarks});
}

final class LoadingBookmarkState extends ActionsState {}

final class GetChargingPointsState extends ActionsState {
  final List<ChargingPoint> chargingPoints;

  GetChargingPointsState({required this.chargingPoints});
}

final class AddBookmarkState extends ActionsState {
  final bool isBookmarked;

  AddBookmarkState({required this.isBookmarked});
}

final class DeleteBookmarkState extends ActionsState {
  final bool isBookmarked;

  DeleteBookmarkState({required this.isBookmarked});
}

final class CaponState extends ActionsState {}

final class ChargerFilterState extends ActionsState {
  final int selected;

  ChargerFilterState({required this.selected});
}

class FilterChargingSpeedState extends ActionsState {}

class FilterStarState extends ActionsState {}

final class LoadingState extends ActionsState {}

final class ErrorState extends ActionsState {}
