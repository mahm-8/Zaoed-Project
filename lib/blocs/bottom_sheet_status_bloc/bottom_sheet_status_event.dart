part of 'bottom_sheet_status_bloc.dart';

@immutable
sealed class BottomSheetStatusEvent {}

class UpdateStatusEvent extends BottomSheetStatusEvent {
  final String? point;
  final String? imageType;
  final String? hour;
  final ChargingPoint? chargingPoint;

  UpdateStatusEvent({
    this.chargingPoint,
    this.imageType,
    this.hour,
    this.point,
  });
}

class StatusEvent extends BottomSheetStatusEvent {}

class StatusBottomEvent extends BottomSheetStatusEvent {}

class StatusBottomSheetEvent extends BottomSheetStatusEvent {}

class TestEvent extends BottomSheetStatusEvent {
  final Status status;

  TestEvent({required this.status});
}
