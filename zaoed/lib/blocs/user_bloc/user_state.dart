abstract class UserState {}

final class UserInitial extends UserState {}

final class GenderState extends UserState {
  final String gender;

  GenderState({required this.gender});
}
