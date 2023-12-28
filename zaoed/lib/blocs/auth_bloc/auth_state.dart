part of 'auth_bloc.dart';

abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class SuccessSignupState extends AuthStates {}

class ErrorSignupState extends AuthStates {
  final String msg;

  ErrorSignupState({required this.msg});
}

class ValidLoginState extends AuthStates {}

class DisplayState extends AuthStates {
  final bool display;
  DisplayState({required this.display});
}

class ErrorSignupValidState extends AuthStates {}

final class ErrorVerificationState extends AuthStates {
  final String message;

  ErrorVerificationState(this.message);
}

final class ErrorLoginState extends AuthStates {
  final String message;

  ErrorLoginState(this.message);
}
final class LogoutSuccessState extends AuthStates {}

final class ErrorLogoutState extends AuthStates {
  final String msg;

  ErrorLogoutState(this.msg);
}
class CheckLoginState extends AuthStates {}

class ErrorCheckState extends AuthStates {}
final class SuccessLoginState extends AuthStates {}
class SuccessChangePass extends AuthStates{
  
}

final class SuccessVerificationState extends AuthStates {}
