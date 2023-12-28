part of 'card_bloc.dart';

@immutable
sealed class CardEvent {}

class AddCardEvent extends CardEvent {
  final String name;
  final String cardNumber;
  final String endDate;
  final String cvv;

  AddCardEvent({required this.name, required this.cardNumber, required this.endDate, required this.cvv});
}

class GetCardDateEvent extends CardEvent{}