part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String username;
  final GlobalKey<FormState> keyEmail;
  final GlobalKey<FormState> keyPassword;
  final GlobalKey<FormState> keyUsername;

  SignUpEvent(this.email, this.password, this.username, this.keyEmail,
      this.keyPassword, this.keyUsername);
}

class VerificationEvent extends AuthEvent {
  final String otp;
  final String email;

  VerificationEvent({
    required this.otp,
    required this.email,
  });
}

class DisplayPasswordEvent extends AuthEvent {
  bool display;

  DisplayPasswordEvent(this.display);
}

class LogInAuthEvent extends AuthEvent {
  final String email;
  final String password;
  final GlobalKey<FormState> emailKey;
  final GlobalKey<FormState> passwordKey;
  LogInAuthEvent(
      {required this.email,
      required this.password,
      required this.emailKey,
      required this.passwordKey});
}

class LogoutEvent extends AuthEvent {}

class UpdatePassword extends AuthEvent {
 final String pass;
final String email;

  UpdatePassword(this.pass, this.email);
  
}
