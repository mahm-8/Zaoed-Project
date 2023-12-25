part of 'finder_bloc.dart';

@immutable
abstract class FinderEvent {}

class GetBookmarkEvent extends FinderEvent {}

class AddBookmarkEvent extends FinderEvent {
  final String? bookmarkname, location;
  final double? rate;
  final int? id, chargeTimes;
  final String? idAuth;

  AddBookmarkEvent({
    required this.id,
    required this.bookmarkname,
    required this.location,
    required this.rate,
    required this.chargeTimes,
    required this.idAuth,
  });
}

class DeleteBookmarkEvent extends FinderEvent {
  final int? id;

  DeleteBookmarkEvent({required this.id});
}
