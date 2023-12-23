import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaoed/blocs/user_bloc/user_event.dart';
import 'package:zaoed/blocs/user_bloc/user_state.dart';
import 'package:zaoed/service/networking.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UpdateUserEvent>((event, emit) async {
      final supabase = SupabaseNetworking().getSupabase;
      try {
        final id = supabase.auth.currentUser?.id;
        await supabase.from('user').update({
          "name": event.user?.name,
          "birthday": event.user?.birthday,
          "gender": event.user?.gender,
          "phone": event.user?.phone,
        }).eq('id_auth', id!);
      } catch (e) {
        return;
      }
    });
  }
}
