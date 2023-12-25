part of 'finder_bloc.dart';

abstract class FinderState {}

final class FinderInitial extends FinderState {}

final class BookmarkAddState extends FinderState {}

final class DeleteBookmarkState extends FinderState {}

final class GetBookmarkState extends FinderState {
  final List<BookmarkModel>? bookmarks;

  GetBookmarkState({required this.bookmarks});
}

final class LoadingState extends FinderState {}

final class ErrorState extends FinderState {}
