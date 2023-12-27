abstract class UserState {}

final class UserInitial extends UserState {}

final class GenderState extends UserState {
  final String gender;

  GenderState({required this.gender});
}
final class SuccessUpdateState extends UserState {
  final String msg;

  SuccessUpdateState({required this.msg});
}
final class SuccessState extends UserState {
  final String gender;

  SuccessState({required this.gender});
}
class UploadImageState extends UserState {
  final String url;

  UploadImageState(this.url);
}
class ErrorUploadState extends UserState {
  final String msg;

  ErrorUploadState({required this.msg});
}

