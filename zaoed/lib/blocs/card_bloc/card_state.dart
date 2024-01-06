part of 'card_bloc.dart';

@immutable
sealed class CardState {}

final class CardInitial extends CardState {}

class AddCardState extends CardState {}

class GetCardDataState extends CardState {
  final List<CardModel?> cards;

  GetCardDataState(this.cards);
}
