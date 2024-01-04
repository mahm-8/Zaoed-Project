// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'dart:math';

import 'package:zaoed/constants/imports.dart';
import 'package:intl/intl.dart';
part 'finder_event.dart';
part 'finder_state.dart';

class FinderBloc extends Bloc<FinderEvent, FinderState> {
  StreamController myController = StreamController();
  Stream? myStream;
  late int staticRemainingTimeHour = 0;
  late int remainingTimeHour = 0;
  late double labelHours = 0;
  double completedPercentage = 0;
  late Timer timer;
  late String formattedTime;
  List? invoiceList;
  ChargingPoint? point;

  FinderBloc() : super(FinderInitial()) {
    on<PayEvent>(invoice);
    on<InvoiceDataEvent>(invoiceDate);
    on<PaymentStatusEvent>(paymentState);
    on<AddCarsChargeEvent>(bookCar);
    on<LoadDataTimerEvent>((event, emit) async {
      final supabase = SupabaseNetworking().getSupabase;
      final id = supabase.auth.currentUser?.id;
      try {
        final response = await supabase
            .from('cars_booking')
            .select('hours,timer')
            .match({'id_auth': id!, "status": "progress"});

        final data = response.first;
        staticRemainingTimeHour = int.parse(data['hours']) * 1;
        remainingTimeHour = staticRemainingTimeHour;
        add(TimerEvent());
        emit(LoadDataTimerState());
        myController.sink.add("event");
      } catch (e) {
        return;
      }
    });
    on<TimerEvent>((event, emit) async {
      try {
        formattedTime = timeFormat(remainingTimeHour);
      } catch (e) {
        return;
      }
    });
    myStream = myController.stream;
    myStream?.listen((event) async {
      emit(TimerDataState(
          formattedTime, timeFormat(remainingTimeHour), completedPercentage));
      if (completedPercentage == 100) {
        ChargingBloc().add(CompleteCarsEvent());
        final supabase = SupabaseNetworking().getSupabase;
        final id = supabase.auth.currentUser?.id;
        await supabase
            .from('cars_booking')
            .update({"status": "complete"}).match(
                {'id_auth': id!, "status": "progress"});
      }
    });
    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      timeFormat(remainingTimeHour.toInt());
      if (remainingTimeHour > 0 && completedPercentage < 100) {
        remainingTimeHour -= 1;
        // completedPercentage += 0.1;
        completedPercentage = ((staticRemainingTimeHour - remainingTimeHour) /
                staticRemainingTimeHour) *
            100;

        myController.sink.add("event");
      }
    });
  }
  String timeFormat(remainingHours) {
    final hours = Duration(minutes: remainingHours);
    final formattedTime = DateFormat('HH:mm').format(DateTime(0).add(hours));
    return formattedTime;
  }

  FutureOr<void> invoice(PayEvent event, Emitter<FinderState> emit) async {
    try {
      final supabase = SupabaseNetworking().getSupabase;
      final id = supabase.auth.currentUser!.id;
      // final date = '${DateTime.now()}';
      // final dateFormat = DateFormat().ad().format(date);
      final token = generateToken();
      await supabase.from("invoice").insert({
        "provider_name": event.providerName,
        "amount": event.amount,
        "tax": 0.15,
        "address": event.address,
        "type": event.type,
        "id_auth": id,
        "token": token,
        "id_point": event.idPoint
      });
    } catch (error) {
      ErrorState(message: error.toString());
    }
  }

  String generateToken() {
    final random = Random();
    final token = List.generate(20, (_) => random.nextInt(10)).join();
    final formattedToken = token.replaceAllMapped(
        RegExp(r".{4}"), (match) => '${match.group(0)}-');
    return formattedToken.substring(0, formattedToken.length - 1);
  }

  FutureOr<void> invoiceDate(
      InvoiceDataEvent event, Emitter<FinderState> emit) async {
    try {
      final supabase = SupabaseNetworking().getSupabase;
      final id = supabase.auth.currentUser!.id;

      final datalist =
          await supabase.from("invoice").select().eq("id_auth", id);

      emit(InvoiceDataState(invoice: datalist));
    } catch (e) {
      ErrorState(message: e.toString());
    }
  }

  FutureOr<void> paymentState(
      PaymentStatusEvent event, Emitter<FinderState> emit) {
    if (event.status == 'paid' || event.status == "authorized") {
      emit(SuccessPayState());
    } else if (event.status == "failed") {
      emit(ErrorPayState());
    }
  }

  FutureOr<void> bookCar(
      AddCarsChargeEvent event, Emitter<FinderState> emit) async {
    try {
      String hours = '';
      switch (event.hour) {
        case 'ساعة':
          hours = "1";
          break;
        case "ساعتان":
          hours = "2";
          break;
        case "3 ساعات":
          hours = "3";
          break;
        case "4 ساعات":
          hours = "4";
          break;
        case "5 ساعات":
          hours = "5";
          break;
        case "6 ساعات":
          hours = "6";
          break;
        case "8 ساعات":
          hours = "8";
          break;
        default:
      }
      final supabase = SupabaseNetworking().getSupabase;
      final id = supabase.auth.currentUser?.id;
      final car = await supabase.from("cars").select().eq("id_user", id!);
      await supabase.from('cars_booking').insert({
        'id_auth': id,
        "status": "progress",
        "id_cars": car.last["id"],
        "hours": hours,
        "id_povider": event.chargingPoint.pointAuthID,
        "id_point": event.chargingPoint.pointId
      });
      point = event.chargingPoint;
      await Future.delayed(const Duration(seconds: 2));
      ChargingBloc().add(EmptyCarsEvent());
      add(LoadDataTimerEvent());
    } catch (e) {
      ErrorState(message: e.toString());
    }
  }
}
