part of 'card_bloc.dart';

@immutable
sealed class CardState {}

final class CardInitial extends CardState {}

class AddCardState extends CardState{}
class GetCardDataState extends CardState{}
// class AddCardState extends CardState {
//   final String name;
//   final String cardNumber;
//   final String endDate;
//   final String cvv;

//   AddCardState({required this.name, required this.cardNumber, required this.endDate, required this.cvv});
// }