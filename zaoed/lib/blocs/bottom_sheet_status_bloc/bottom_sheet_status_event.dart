part of 'bottom_sheet_status_bloc.dart';

@immutable
sealed class BottomSheetStatusEvent {}
class UpdateStatusEvent extends BottomSheetStatusEvent {
  final Status status;

  UpdateStatusEvent({required this.status});
}