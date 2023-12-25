import 'package:zaoed/model/user_model.dart';

abstract class UserEvent {}

class UpdateUserEvent extends UserEvent {
  final UserModel? user;

  UpdateUserEvent(this.user);
}
final class GenderEvent extends UserEvent {
  final String gender;

  GenderEvent({required this.gender});
}
