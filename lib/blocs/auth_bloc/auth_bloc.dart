import 'package:zaoed/constants/imports.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthStates> {
  UserModel? user;
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>(signUp);
    on<VerificationEvent>(verificationMethod);
    on<DisplayPasswordEvent>(displayPass);
    on<LogInAuthEvent>(login);
    on<CheckLoginEvent>(_check);
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
          type: event.type,
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
          "type": user?.type
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
          emit(ErrorLoginState("خطأ"));
        }
      } else {
        emit(ValidLoginState());
      }
    } on AuthException {
      emit(ErrorLoginState("البريد الإلكتروني أو كلمة السر خاطئة"));
    } catch (e) {
      return;
    }
  }

  FutureOr<void> _check(CheckLoginEvent event, Emitter<AuthStates> emit) async {
    try {
      final supabaseClint = SupabaseNetworking().getSupabase;
      await Future.delayed(const Duration(seconds: 1));
      if (supabaseClint.auth.currentUser?.emailConfirmedAt != null) {
        final token = supabaseClint.auth.currentSession?.accessToken;
        final isExp = supabaseClint.auth.currentSession!.isExpired;

        if (token != null) {
          final id = supabaseClint.auth.currentUser?.id;

          if (isExp) {
            await supabaseClint.auth
                .setSession(supabaseClint.auth.currentSession!.refreshToken!);
            final type = await supabaseClint
                .from('user')
                .select('type')
                .eq('id_auth', id!);
            emit(CheckLoginState(type[0]['type']));
          } else {
            final type = await supabaseClint
                .from('user')
                .select('type')
                .eq('id_auth', id!);
            emit(CheckLoginState(type[0]['type']));
          }
        } else {
          emit(ErrorCheckState());
        }
      } else {
        emit(ErrorCheckState());
      }
    } catch (e) {
      emit(ErrorCheckState());
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
