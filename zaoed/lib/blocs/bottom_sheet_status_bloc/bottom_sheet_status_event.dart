part of 'bottom_sheet_status_bloc.dart';

@immutable
sealed class BottomSheetStatusEvent {}

class UpdateStatusEvent extends BottomSheetStatusEvent {
  final Status status;
  final String? point;
  final String? imageType;
  final String? hour;
  final ChargingPoint? chargingPoint;

  UpdateStatusEvent(
      {this.chargingPoint,
      this.imageType,
      this.hour,
      this.point,
      required this.status});
}

class StatusBottomEvent extends BottomSheetStatusEvent {}

class StatusBottomSheetEvent extends BottomSheetStatusEvent {}
