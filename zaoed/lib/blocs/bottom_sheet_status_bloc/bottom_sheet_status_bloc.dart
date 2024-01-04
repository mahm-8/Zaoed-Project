import 'dart:async';
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
  Status? statusUsed;
  // Status? stat;
  BottomSheetStatusBloc() : super(BottomSheetStatusInitial()) {
    on<StatusBottomSheetEvent>(bottomSheetUp);
    on<StatusEvent>(statusSwitch);
    on<UpdateStatusEvent>((event, emit) {
      image = event.imageType;
      point = event.point;
      hour = event.hour;
      chargingPoint = event.chargingPoint;
      emit(SuccessStatusState(status: event.status));
      print(event.status);
      statusUsed = event.status;
      // add(StatusEvent());
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
        if (data.isNotEmpty) {
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
        print("----------++++****InProcessing++++*****-----------");
        context.receiveDialog();
        break;
      // case Status.reachedChargingPoint:
      //   log("$chargingPoint".toString());
      //   if (chargingPoint != null) {
      //     context.arrivedToCharging(chargingPoint: chargingPoint);
      //   }
      //   break;
      case Status.InProcessing:
        print("InProcessing");
        context.chargingCarSheet();

        break;
      case Status.rating:
        print("rating");
        ratingBottomSheet(context);

        break;
      default:
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

  FutureOr<void> statusSwitch(
      StatusEvent event, Emitter<BottomSheetStatusState> emit) {
    if (statusUsed != null) {
      print("++++++++++++ REQUSERT+++++++++++++++");
      emit(SuccessStatusState(status: statusUsed!));
    }
  }
}
