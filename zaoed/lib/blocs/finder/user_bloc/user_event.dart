import 'package:zaoed/constants/imports.dart';

abstract class UserEvent {}

class UpdateUserEvent extends UserEvent {
  final UserModel? user;

  UpdateUserEvent(this.user);
}

final class GenderEvent extends UserEvent {
  final String gender;

  GenderEvent({required this.gender});
}

final class GetUserDataEvent extends UserEvent {}

final class UploadImageEvent extends UserEvent {
  final Uint8List image;

  UploadImageEvent(this.image);
}
