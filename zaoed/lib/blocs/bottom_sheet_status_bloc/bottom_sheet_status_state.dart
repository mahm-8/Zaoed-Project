part of 'bottom_sheet_status_bloc.dart';

@immutable
sealed class BottomSheetStatusState {}

final class BottomSheetStatusInitial extends BottomSheetStatusState {}

final class SuccessStatusState extends BottomSheetStatusState {
  final Status status;

  SuccessStatusState({required this.status});
}
