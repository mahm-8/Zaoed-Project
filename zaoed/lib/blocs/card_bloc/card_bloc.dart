import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/service/networking.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  List? CardList;
  CardBloc() : super(CardInitial()) {
    on<AddCardEvent>((event, emit) async {
      final supabase = SupabaseNetworking().getSupabase;
      try {
        await supabase.from('card').insert({
          'name': event.name,
          'number_card': event.cardNumber,
          'exp_card': event.endDate,
          'csv': event.cvv
        });

        emit(AddCardState());
      } catch (e) {
        print(e.toString());
      }
    });

    on<GetCardDateEvent>((event, emit) async {
      try {
        final supabase = SupabaseNetworking().getSupabase;
        CardList = await supabase.from('card').select();
        print(CardList);
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
