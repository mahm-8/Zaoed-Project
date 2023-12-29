import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:zaoed/components/sheet_method/arrived_dialog.dart';
import 'package:zaoed/components/sheet_method/car_charging_sheet.dart';
import 'package:zaoed/components/sheet_method/rating_boottom_sheet.dart';
import 'package:zaoed/components/sheet_method/receive_dialog.dart';

part 'bottom_sheet_status_event.dart';
part 'bottom_sheet_status_state.dart';

enum Status {
  completedPayment,
  reachedChargingPoint,
  InProcessing,
  rating,
}
class BottomSheetStatusBloc
    extends Bloc<BottomSheetStatusEvent, BottomSheetStatusState> {
  final statusController = StreamController<Status>();
  BottomSheetStatusBloc() : super(BottomSheetStatusInitial()) {
    updateStatus(Status status) {
      statusController.sink.add(status);
    }

    on<BottomSheetStatusEvent>((event, emit) {
      if (event is UpdateStatusEvent) {
        updateStatus(event.status);
      }
    });
  }
 switchShowBottomSheet(BuildContext context, Status status) {
    switch (status) {
      case Status.completedPayment:
        context.receiveDialog();
        break;
      case Status.reachedChargingPoint:
        context.arrivedToCharging();
        break;
      case Status.InProcessing:
        context.chargingCarSheet();
        break;
      case Status.rating:
        ratingBottomSheet(context);
        break;
      default:
        return Container();
    }
  }
}
