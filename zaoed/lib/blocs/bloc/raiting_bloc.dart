import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaoed/constants/imports.dart';

part 'raiting_event.dart';
part 'raiting_state.dart';

class RaitingBloc extends Bloc<RaitingEvent, RaitingState> {
  RaitingBloc() : super(RaitingInitial()) {
    on<UpdateRateEvent>((event, emit) {
      emit(UpdateRateState(rate: event.rate));
    });
    on<SaveRateEvent>(sendRate);
  }

  FutureOr<void> sendRate(
      SaveRateEvent event, Emitter<RaitingState> emit) async {
    try {
      final supabase = SupabaseNetworking().getSupabase;
      final id = supabase.auth.currentUser!.id;
      await supabase.from('rates').insert(
          {"id_auth": id, "hourly_rate": event.rate, "comment": event.comment});
      emit(UpdateRateState(rate: 0.0));
    } on PostgrestException catch (e) {
      print(e.message);
      return;
    } catch (e) {
      print(e);
      return;
    }
  }
}
