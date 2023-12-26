import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zaoed/model/user_model.dart';
import 'package:zaoed/service/networking.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthStates> {
  UserModel? user;
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>(signUp);
    on<VerificationEvent>(verificationMethod);
    on<DisplayPasswordEvent>(displayPass);
    on<LogInAuthEvent>(login);
    on<LogoutEvent>(logoutMethod);
  }
  signUp(SignUpEvent event, emit) async {
    List<bool> isValidation = [];
    try {
      isValidation.add(validation(keyForm: event.keyEmail));
      isValidation.add(validation(keyForm: event.keyPassword));
      isValidation.add(validation(keyForm: event.keyUsername));
      if (!isValidation.contains(false)) {
        final auth = SupabaseNetworking().getSupabase.auth;
       await auth.signUp(email: event.email, password: event.password);

        user = UserModel(
          name: event.username,
          email: event.email,
        );
        emit(SuccessSignupState());
      } else {
        emit(ErrorSignupValidState());
      }
    } catch (e) {
      return;
    }
  }

  validation({required GlobalKey<FormState> keyForm}) {
    if (!keyForm.currentState!.validate()) {
      return false;
    }
    return true;
  }

  FutureOr<void> verificationMethod(
      VerificationEvent event, Emitter<AuthStates> emit) async {
    try {
      final auth = SupabaseNetworking().getSupabase.auth;
      final verification = await auth.verifyOTP(
          token: event.otp, type: OtpType.signup, email: event.email);
      if (verification.session?.accessToken != null) {
        await Future.delayed(const Duration(seconds: 1));

        await SupabaseNetworking().getSupabase.from("user").insert({
          "name": user?.name,
          "email": user?.email,
          "id_auth": verification.user?.id,
        });
        emit(SuccessVerificationState());
      } else {
        emit(ErrorVerificationState("الرمز خاطئ"));
      }
    } on AuthException catch (e) {
      emit(ErrorVerificationState(e.message));
    } on PostgrestException catch (e) {
      emit(ErrorVerificationState(e.message));
    } catch (e) {
      emit(ErrorVerificationState(e.toString()));
    }
  }

  FutureOr<void> displayPass(
      DisplayPasswordEvent event, Emitter<AuthStates> emit) {
    if (event.display == true) {
      event.display = false;
      emit(DisplayState(display: event.display));
    } else {
      event.display = true;
      emit(DisplayState(display: event.display));
    }
  }

  FutureOr<void> login(LogInAuthEvent event, Emitter<AuthStates> emit) async {
    List<bool> isValidation = [];
    try {
      isValidation.add(validation(keyForm: event.emailKey));
      isValidation.add(validation(keyForm: event.passwordKey));
      if (!isValidation.contains(false)) {
        final auth = SupabaseNetworking().getSupabase.auth;

        final login = await auth.signInWithPassword(
            email: event.email, password: event.password);
        if (login.user?.id != null) {
          emit(SuccessLoginState());
        } else if (login.user?.id == null) {
          emit(ErrorLoginState("Wrong!!!!1"));
        }
      } else {
        emit(ValidLoginState());
      }
    } on AuthException {
      emit(ErrorLoginState("Password or email wrong"));
    } catch (e) {
      print(e);
      return;
    }
  }
  FutureOr<void> logoutMethod(
      LogoutEvent event, Emitter<AuthStates> emit) async {
    try {
      final supabase = SupabaseNetworking().getSupabase;
      await supabase.auth.signOut();
      emit(LogoutSuccessState());
    } catch (error) {
      emit(ErrorLogoutState(error.toString()));
    }
  }
}
