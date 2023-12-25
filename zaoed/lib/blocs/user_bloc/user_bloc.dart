import 'package:zaoed/constants/imports.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final supabase = SupabaseNetworking().getSupabase;

  UserBloc() : super(UserInitial()) {
    on<UpdateUserEvent>(updateUserMethod);
  }

  FutureOr<void> updateUserMethod(
      UpdateUserEvent event, Emitter<UserState> emit) async {
    final id = supabase.auth.currentUser?.id;
    try {
      await supabase.from('user').update({
        "name": event.user?.name,
        "birthday": event.user?.birthday,
        "gender": event.user?.gender,
        "phone": event.user?.phone,
      }).eq('id_auth', id!);
    } catch (e) {
      return;
    }
  }
}
