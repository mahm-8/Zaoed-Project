part of 'bottom_sheet_status_bloc.dart';

@immutable
sealed class BottomSheetStatusState {}

final class BottomSheetStatusInitial extends BottomSheetStatusState {}

final class SuccessStatusState extends BottomSheetStatusState {
  final Status status;

  SuccessStatusState({required this.status});
}

final class ChargingProgressState extends BottomSheetStatusState {}

final class DestinationState extends BottomSheetStatusState {}

final class ScanProgressState extends BottomSheetStatusState {}

final class ArrivalState extends BottomSheetStatusState {}

final class RaitingBootomSheetState extends BottomSheetStatusState {}
