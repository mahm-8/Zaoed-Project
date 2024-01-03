import 'dart:developer';

import '../../constants/imports.dart';

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
  Status? stat;
  BottomSheetStatusBloc() : super(BottomSheetStatusInitial()) {
    on<UpdateStatusEvent>((event, emit) {
      image = event.imageType;
      point = event.point;
      hour = event.hour;
      chargingPoint = event.chargingPoint;
      print(event.status);
      stat = event.status;
      log("xxxxxxxxxxxxxxxxxxxxx$stat.xxxxxxxxxxxxxxxxxxxxxx");
    });
    on<StatusBottomEvent>((event, emit) {
      print(stat);
      emit(SuccessStatusState(status: Status.reachedChargingPoint));
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
}
