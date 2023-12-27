part of 'actions_bloc.dart';

class ActionsEvent {}

class GetBookmarkEvent extends ActionsEvent {}

class AddBookmarkEvent extends ActionsEvent {
  final String? pointName, chargingPort, pointLocation;
  final double? rating;
  final int? bookmarkID, chrgingTimes, portCount;

  AddBookmarkEvent({
    required this.bookmarkID,
    required this.pointName,
    required this.pointLocation,
    required this.rating,
    required this.chargingPort,
    required this.chrgingTimes,
    required this.portCount,
  });
}

class DeleteBookmarkEvent extends ActionsEvent {
  final int? bookmarkID;

  DeleteBookmarkEvent({required this.bookmarkID});
}
