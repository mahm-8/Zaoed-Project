import 'package:zaoed/constants/imports.dart';

part 'finder_event.dart';
part 'finder_state.dart';

final supabaseMethod = SupabaseMethods();
bool isBookmarked = false;
final supabase = SupabaseNetworking().getSupabase;
final id = supabase.auth.currentUser?.id;

class FinderBloc extends Bloc<FinderEvent, FinderState> {
  List<BookmarkModel>? bookmarkData;

  FinderBloc() : super(FinderInitial()) {
    on<FinderEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AddBookmarkEvent>(addBookmarkMethod);
    on<GetBookmarkEvent>(getBookmarkMethod);
    on<DeleteBookmarkEvent>(deleteBookmarkMethod);
  }

  FutureOr<void> getBookmarkMethod(
      FinderEvent event, Emitter<FinderState> emit) async {
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
      AddBookmarkEvent event, Emitter<FinderState> emit) async {
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
      DeleteBookmarkEvent event, Emitter<FinderState> emit) async {
    try {
      await supabaseMethod.removeBookmark(id: event.id);
      emit(DeleteBookmarkState());
      isBookmarked = false;
    } catch (e) {
      emit(ErrorState());
    }
  }
}
