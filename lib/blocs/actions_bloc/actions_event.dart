part of 'actions_bloc.dart';

class ActionsEvent {}

class GetChargingPointsEvent extends ActionsEvent {}

class GetBookmarkEvent extends ActionsEvent {}

class AddBookmarkEvent extends ActionsEvent {
  final int? pointID;

  AddBookmarkEvent({
    required this.pointID,
  });
}

class DeleteBookmarkEvent extends ActionsEvent {
  final int? bookmarkID;

  DeleteBookmarkEvent({
    required this.bookmarkID,
  });
}

class CaponEvent extends ActionsEvent {
  final double price;
  final String capon;

  CaponEvent({required this.capon, required this.price});
}

class StatusCarsEvent extends ActionsEvent {}

class FilterChargerSelectionEvent extends ActionsEvent {
  final int index;

  FilterChargerSelectionEvent(this.index);
}

class ChargingSpeedFilterEvent extends ActionsEvent {
  final int index;
  final bool value;

  ChargingSpeedFilterEvent(this.index, this.value);
}

class StarFilterEvent extends ActionsEvent {
  final int index;
  final bool value;

  StarFilterEvent(this.index, this.value);
}
