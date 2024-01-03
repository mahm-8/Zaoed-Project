import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:zaoed/components/sheet_method/arrived_dialog.dart';
import 'package:zaoed/components/sheet_method/car_charging_sheet.dart';
import 'package:zaoed/components/sheet_method/rating_boottom_sheet.dart';
import 'package:zaoed/components/sheet_method/receive_dialog.dart';
import 'package:zaoed/model/bookmark_model.dart';
import 'package:zaoed/service/networking.dart';
part 'bottom_sheet_status_event.dart';
part 'bottom_sheet_status_state.dart';

enum Status {
  completedPayment,
  reachedChargingPoint,
  InProcessing,
  rating,
  nono
}

class BottomSheetStatusBloc
    extends Bloc<BottomSheetStatusEvent, BottomSheetStatusState> {
  String? image;
  String? point;
  String? hour;
  ChargingPoint? chargingPoint;
  Status currentStatus = Status.nono;
  // Status? stat;
  BottomSheetStatusBloc() : super(BottomSheetStatusInitial()) {
    on<StatusBottomSheetEvent>(bottomSheetUp);
    on<UpdateStatusEvent>((event, emit) {
      image = event.imageType;
      point = event.point;
      hour = event.hour;
      chargingPoint = event.chargingPoint;
      print(event.status);
      emit(SuccessStatusState(status: event.status));
      // stat = event.status;
      // log("xxxxxxxxxxxxxxxxxxxxx$stat.xxxxxxxxxxxxxxxxxxxxxx");
    });
    on<StatusBottomEvent>((event, emit) async {
      // print(stat);
      // await Future.delayed(Duration(seconds: 30), () async {
      try {
        final supabase = SupabaseNetworking().getSupabase;
        final id = supabase.auth.currentUser!.id;
        final data = await supabase
            .from("invoice")
            .select()
            .match({'id_auth': id, "destination": "destination"});
        print(data);
        if (data != null) {
          emit(DestinationState());
        }
      } catch (e) {
        print(e);
      }
      // });
      // emit(SuccessStatusState(status: Status.reachedChargingPoint));
    });
  }

  switchShowBottomSheet(BuildContext context, Status status) {
    if (status == currentStatus) {
      return;
    }
    currentStatus = status;

    switch (status) {
      case Status.completedPayment:
        print("completedPayment");
        context.receiveDialog();

        break;
      case Status.reachedChargingPoint:
        log("$chargingPoint".toString());
        if (chargingPoint != null) {
          context.arrivedToCharging(chargingPoint: chargingPoint);
        }

        break;
      case Status.InProcessing:
        print("InProcessing");

        context.chargingCarSheet();

        break;
      case Status.rating:
        print("rating");
        ratingBottomSheet(context);

        break;
      default:
        print("stop");
        Container();
        break;
    }
  }

  FutureOr<void> bottomSheetUp(StatusBottomSheetEvent event,
      Emitter<BottomSheetStatusState> emit) async {
    try {
      print("start");
      final supabase = SupabaseNetworking().getSupabase;
      final id = supabase.auth.currentUser!.id;
      await supabase
          .from("invoice")
          .update({"destination": "scan"}).eq('id_auth', id);
      print("send");
    } catch (e) {
      print("$e===============================");
    }
  }
}
