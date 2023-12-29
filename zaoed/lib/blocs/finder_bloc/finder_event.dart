part of '../finder_bloc/finder_bloc.dart';

@immutable
sealed class FinderEvent {}

class LoadDataTimerEvent extends FinderEvent {}

class TimerEvent extends FinderEvent {}

class InvoiceDataEvent extends FinderEvent {}

class PayEvent extends FinderEvent {
  final String nameFinder;
  final String type;
  final double amount;
  final String providerName;
  // final double totalPrice;
  final String address;

  PayEvent(
      {required this.nameFinder,
      required this.type,
      required this.amount,
      required this.providerName,
      // required this.totalPrice,
      required this.address});
}
