import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:zaoed/blocs/actions_bloc/action_methods.dart';
import 'package:zaoed/model/bookmark_model.dart';
export 'dart:async';
part 'actions_event.dart';
part 'actions_state.dart';

bool isBookmarked = false;

class ActionsBloc extends Bloc<ActionsEvent, ActionsState> {
  List<BookmarkModel>? bookmarkData;
  double? price = 9;
  String? capon;
  ActionsBloc() : super(ActionsInitial()) {
    on<GetBookmarkEvent>(getBookmarkMethod);
    on<AddBookmarkEvent>(addBookmarkMethod);
    on<DeleteBookmarkEvent>(deleteBookmarkMethod);
    // add(GetBookmarkEvent());
    on<CaponEvent>((event, emit) {
      if (capon == 'Zaoed') {
        price = price! - (price! * 0.25);
        return price;
      }
      emit(CaponState());
    });
  }

  FutureOr<void> getBookmarkMethod(
      GetBookmarkEvent event, Emitter<ActionsState> emit) async {
    try {
      emit(LoadingState());

      bookmarkData = await ActionSupabaseMethods().getBookmarks();
      await Future.delayed(const Duration(seconds: 1));
      emit(GetBookmarkState(bookmarks: bookmarkData!));
    } catch (e) {
      emit(ErrorState());
    }
  }

  FutureOr<void> addBookmarkMethod(
      AddBookmarkEvent event, Emitter<ActionsState> emit) async {
    try {
      await ActionSupabaseMethods().addBookmark({});
      emit(AddBookmarkState());
      isBookmarked = true;
      add(GetBookmarkEvent());
      emit(LoadingState());
    } catch (e) {
      emit(ErrorState());
    }
  }

  FutureOr<void> deleteBookmarkMethod(
      DeleteBookmarkEvent event, Emitter<ActionsState> emit) async {
    try {
      await ActionSupabaseMethods().deleteBookmark(id: event.bookmarkID);
      emit(DeleteBookmarkState());
      isBookmarked = false;
      add(GetBookmarkEvent());
      emit(LoadingState());
    } catch (e) {
      emit(ErrorState());
    }
  }
}
