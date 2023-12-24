import 'package:zaoed/constants/imports.dart';

bool isBookmarked = false;
final supabase = SupabaseNetworking().getSupabase;
final id = supabase.auth.currentUser?.id;
final supabaseMethod = SupabaseMethods();

class UserBloc extends Bloc<UserEvent, UserState> {
  List<BookmarkModel>? bookmarkData;

  UserBloc() : super(UserInitial()) {
    on<UpdateUserEvent>(updateUserMethod);
    on<AddBookmarkEvent>(addBookmarkMethod);
    on<GetBookmarkEvent>(getBookmarkMethod);
    on<DeleteBookmarkEvent>(deleteBookmarkMethod);
  }

  FutureOr<void> updateUserMethod(
      UpdateUserEvent event, Emitter<UserState> emit) async {
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

  FutureOr<void> getBookmarkMethod(
      UserEvent event, Emitter<UserState> emit) async {
    try {
      emit(LoadingState());
      bookmarkData = await supabaseMethod.getBookmark();
      await Future.delayed(const Duration(seconds: 1));
      emit(GetBookmarkState(bookmarks: bookmarkData));
    } catch (e) {
      emit(ErrorState());
    }
  }

  FutureOr<void> addBookmarkMethod(
      AddBookmarkEvent event, Emitter<UserState> emit) async {
    try {
      await supabaseMethod.addBookmark({
        "bookmark_name": event.bookmarkname,
        "rating": event.rate,
        "charging_times": event.chargeTimes,
        "location": event.location,
        "id_auth": event.idAuth,
      });
      emit(BookmarkAddState());
      isBookmarked = true;
    } catch (e) {
      // add error message
      emit(ErrorState());
    }
  }

  FutureOr<void> deleteBookmarkMethod(
      DeleteBookmarkEvent event, Emitter<UserState> emit) async {
    try {
      await supabaseMethod.removeBookmark(id: event.id);
      emit(DeleteBookmarkState());
      isBookmarked = false;
    } catch (e) {
      emit(ErrorState());
    }
  }
}
