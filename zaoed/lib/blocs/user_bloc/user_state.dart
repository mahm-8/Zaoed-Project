import 'package:zaoed/constants/imports.dart';

abstract class UserState {}

final class UserInitial extends UserState {}

final class BookmarkAddState extends UserState {}

final class DeleteBookmarkState extends UserState {}

final class GetBookmarkState extends UserState {
  final List<BookmarkModel>? bookmarks;

  GetBookmarkState({required this.bookmarks});
}

final class LoadingState extends UserState {}

final class ErrorState extends UserState {}
