import 'package:zaoed/constants/imports.dart';

part 'provider_event.dart';
part 'provider_state.dart';

class ProviderBloc extends Bloc<ProviderEvent, ProviderState> {
  ProviderBloc() : super(ProviderInitial()) {
    int count = 0;

    on<HoursSelectIndexEvent>((event, emit) {
      emit(HoursIndexSelectedState(event.selectedIndex));
    });

    on<ChargingTypeIndexSelectedEvent>((event, emit) {
      emit(ChargingTypeIndexSelectedState(event.selectedIndex));
    });
    on<ChargingTypeIncrementCountEvent>((event, emit) {
      count++;
      emit(ChargingTypeCountUpdated(count));
    });
    on<ChargingTypeDecrementCountEvent>((event, emit) {
      if (count > 0) {
        count--;
      }
      emit(ChargingTypeCountUpdated(count));
    });
  }
}
