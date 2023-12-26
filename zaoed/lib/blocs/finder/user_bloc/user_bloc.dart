import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaoed/blocs/finder/user_bloc/user_event.dart';
import 'package:zaoed/blocs/finder/user_bloc/user_state.dart';
import 'package:zaoed/service/networking.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late String gender;
   final List<String> listgender = ["ذكر", "أنثى"];
  UserBloc() : super(UserInitial()) {
    on<GenderEvent>(selectGender);
    on<UpdateUserEvent>((event, emit) async {
      final supabase = SupabaseNetworking().getSupabase;
      try {
        final id = supabase.auth.currentUser?.id;
        if(gender.isNotEmpty) {
          await supabase.from('user').update({
          "name": event.user?.name,
          "birthday": event.user?.birthday,
          "gender": gender,
          "phone": event.user?.phone,
        }).eq('id_auth', id!);
        }
      } catch (e) {
        return;
      }
    });
  }

  FutureOr<void> selectGender(GenderEvent event, Emitter<UserState> emit) {
    if (listgender.contains(event.gender)) {
      gender = event.gender;
      emit(GenderState(gender: event.gender));
    }
  }
}
