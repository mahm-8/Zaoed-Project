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
  BottomSheetStatusBloc() : super(BottomSheetStatusInitial()) {
    on<StatusBottomSheetEvent>(bottomSheetUp);

    on<TestEvent>(testEventMethod);
    on<StatusEvent>(statusSwitch);
    on<UpdateStatusEvent>((event, emit) {
      image = event.imageType;
      point = event.point;
      hour = event.hour;
      chargingPoint = event.chargingPoint;
    });
    on<StatusBottomEvent>((event, emit) async {
      try {
        final supabase = SupabaseNetworking().getSupabase;
        final id = supabase.auth.currentUser!.id;
        final data = await supabase
            .from("invoice")
            .select()
            .match({'id_auth': id, "destination": "destination"});
        if (data.isNotEmpty) {
          add(TestEvent(status: Status.reachedChargingPoint));
        }
      } catch (e) {
        return;
      }
    });

    add(StatusEvent());
  }

  switchShowBottomSheet(BuildContext context, Status status) {
    if (status == currentStatus) {
      return;
    }
    currentStatus = status;

    switch (status) {
      case Status.completedPayment:
        context.receiveDialog();
        break;
      case Status.InProcessing:
        context.chargingCarSheet();
        break;
      case Status.reachedChargingPoint:
        context.arrivedToCharging(chargingPoint: chargingPoint);
        break;
      case Status.rating:
        ratingBottomSheet(context);

        break;
      default:
    }
  }

  FutureOr<void> bottomSheetUp(StatusBottomSheetEvent event,
      Emitter<BottomSheetStatusState> emit) async {
    try {
      final supabase = SupabaseNetworking().getSupabase;
      final id = supabase.auth.currentUser!.id;
      await supabase
          .from("invoice")
          .update({"destination": "scan"}).eq('id_auth', id);
    } catch (e) {
      return;
    }
  }

  FutureOr<void> statusSwitch(
      StatusEvent event, Emitter<BottomSheetStatusState> emit) {
    if (statusUsed != null) {
      emit(SuccessStatusState(status: statusUsed!));
    }
  }

  FutureOr<void> testEventMethod(
      TestEvent event, Emitter<BottomSheetStatusState> emit) {
    statusUsed = event.status;
    emit(TestState(status: event.status));
  }


}
