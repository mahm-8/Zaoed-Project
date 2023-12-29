part of 'actions_bloc.dart';

class ActionsEvent {}

class GetChargingPointsEvent extends ActionsEvent {}

class GetBookmarkEvent extends ActionsEvent {}

class AddBookmarkEvent extends ActionsEvent {
  final int? pointID;

  AddBookmarkEvent({required this.pointID});
}

class DeleteBookmarkEvent extends ActionsEvent {
  final int? bookmarkID;

  DeleteBookmarkEvent({required this.bookmarkID});
}

class CaponEvent extends ActionsEvent {
  final double price;
  final String capon;

  CaponEvent({required this.capon, required this.price});
}


class StatusCarsEvent extends ActionsEvent {}

