part of 'bottom_sheet_status_bloc.dart';

@immutable
sealed class BottomSheetStatusState {}

final class BottomSheetStatusInitial extends BottomSheetStatusState {}

final class SuccessState extends BottomSheetStatusState {
  final Status status;

  SuccessState({required this.status});
}
