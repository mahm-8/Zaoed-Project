part of '../finder_bloc/finder_bloc.dart';

@immutable
sealed class FinderEvent {}

class LoadDataTimerEvent extends FinderEvent {}

class TimerEvent extends FinderEvent {}

class InvoiceDataEvent extends FinderEvent {}

class PaymentStatusEvent extends FinderEvent {
  final String status;

  PaymentStatusEvent(this.status);
}

class AddCarsChargeEvent extends FinderEvent {
  final ChargingPoint chargingPoint;
  final String hour;

  AddCarsChargeEvent({required this.chargingPoint, required this.hour});
}

class PayEvent extends FinderEvent {
  final String nameFinder;
  final String type;
  final double amount;
  final String providerName;
   final int idPoint;
  final String address;

  PayEvent(
      {required this.nameFinder,
      required this.type,
      required this.amount,
      required this.providerName,
       required this.idPoint,
      required this.address});
}
