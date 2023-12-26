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
