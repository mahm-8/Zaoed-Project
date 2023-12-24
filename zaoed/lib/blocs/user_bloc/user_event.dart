import 'package:zaoed/model/user_model.dart';

abstract class UserEvent {}

class UpdateUserEvent extends UserEvent {
  final UserModel? user;

  UpdateUserEvent(this.user);
}

class GetBookmarkEvent extends UserEvent {}

class AddBookmarkEvent extends UserEvent {
  final String? bookmarkname, location;
  final double? rate;
  final int? id, chargeTimes;
  final String? idAuth;

  AddBookmarkEvent({
    required this.id,
    required this.bookmarkname,
    required this.location,
    required this.rate,
    required this.chargeTimes,
    required this.idAuth,
  });
}

class DeleteBookmarkEvent extends UserEvent {
  final int? id;

  DeleteBookmarkEvent({required this.id});
}
