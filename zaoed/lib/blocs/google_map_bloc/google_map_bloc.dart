import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/model/google_map_model.dart';
import 'package:zaoed/service/networking.dart';
import 'dart:math' show cos, sqrt, asin;

import 'package:image/image.dart' as IMG;

import '../bottom_sheet_status_bloc/bottom_sheet_status_bloc.dart';

part 'google_map_event.dart';
part 'google_map_state.dart';

class GoogleMapBloc extends Bloc<GoogleMapEvent, GoogleMapState> {
  final Location location = Location();
  Completer<GoogleMapController> googleMapController = Completer();
  LocationData? currentLocation;
  List chargingPoints = [];
  GoogleMapBloc() : super(GoogleMapInitial()) {
    final supabase = SupabaseNetworking().getSupabase;
    on<FetchPolylineEvent>(polyline);

    on<FetchMarkersEvent>((event, emit) async {
      // emit(MarkerLoadingState());
      try {
        final response = await supabase
            .from('charging_point')
            .select('point_id,latitude,longitude');

        for (var element in response) {
          chargingPoints.add(element);
        }
        if (chargingPoints != []) {
          Uint8List bytes = (await rootBundle.load('lib/assets/icons/pin.png'))
              .buffer
              .asUint8List();
          Uint8List? smallimg = resizeImage(bytes, 70, 70);
          Set<Marker> markers = {};
          markers = createMarkers(
              chargingPoints, BitmapDescriptor.fromBytes(smallimg!));
          emit(MarkerLoadedState(markers));
        }
      } catch (e) {
        print(e);
      }
    });
  }

  Uint8List? resizeImage(Uint8List data, width, height) {
    Uint8List? resizedData = data;
    IMG.Image? img = IMG.decodeImage(data);
    IMG.Image resized = IMG.copyResize(img!, width: width, height: height);
    resizedData = Uint8List.fromList(IMG.encodePng(resized));
    return resizedData;
  }

  Set<Marker> createMarkers(List markerData, BitmapDescriptor markerIcon) {
    final Set<Marker> markers = {};

    for (var element in markerData) {
      final markerId = MarkerId(element['point_id'].toString());
      final latitude = element['latitude'] as double?;
      final longitude = element['longitude'] as double?;

      if (latitude != null && longitude != null) {
        final position = LatLng(latitude, longitude);
        final newMarker = Marker(
          markerId: markerId,
          position: position,
          icon: markerIcon,
        );
        markers.add(newMarker);
      }
    }
    return markers;
  }

  Future<Set<Polyline>> createPolylines(
    LatLng sourceLocation,
    LatLng sourceLocation1,
  ) async {
    final List<LatLng> polylineCoordinates = [];
    final PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyB_pskxOAYeFwmfRTn-nQRRVocOj1Dyj6I',
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(sourceLocation1.latitude, sourceLocation1.longitude),
    );
    print(result);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    Polyline polyline = Polyline(
      polylineId: const PolylineId('route'),
      color: AppColors().green,
      width: 5,
      points: polylineCoordinates,
    );
    return {polyline};
  }

  FutureOr<void> polyline(
      FetchPolylineEvent event, Emitter<GoogleMapState> emit) async {
    try {
      print("staaaaaaaaaaaaaaaaaaaaaaaaaaart");
      currentLocation = await location.getLocation();
      print(currentLocation);
      moveToPosition(LatLng(
        currentLocation?.latitude ?? 0,
        currentLocation?.longitude ?? 0,
      ));

      final dist = calculateDistance(
          currentLocation?.latitude ?? 0,
          currentLocation?.longitude ?? 0,
          event.distention!.latitude,
          event.distention!.longitude);
      if (dist <= 20) {
        // context.read<BottomSheetStatusBloc>().add(UpdateStatusEvent(
        //     status: Status.completedPayment,);
        BottomSheetStatusBloc()
            .add(UpdateStatusEvent(status: Status.reachedChargingPoint));
      } else {
        final polylines = await createPolylines(
            LatLng(
              currentLocation?.latitude ?? 0,
              currentLocation?.longitude ?? 0,
            ),
            event.distention!);
        Uint8List bytes = (await rootBundle.load('lib/assets/icons/pin.png'))
            .buffer
            .asUint8List();
        Uint8List? smallimg = resizeImage(bytes, 70, 70);
        Set<Marker> markers = {};
        markers = createMarkers(
            chargingPoints, BitmapDescriptor.fromBytes(smallimg!));
        emit(FetchPolylineState(polylines, markers));
      }
      await getCurrentLocation();
    } catch (error) {
      print(error);
    }
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    final p = 0.017453292519943295;
    final a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a)) * 1000;
  }

  getCurrentLocation() {
    location.getLocation().then((location) {
      currentLocation = location;

      print(location.longitude);
    });
    location.onLocationChanged.listen((newLocation) {
      currentLocation = newLocation;

      moveToPosition(LatLng(
        currentLocation?.latitude ?? 0,
        currentLocation?.longitude ?? 0,
      ));
    });
  }

  moveToPosition(LatLng latLng) async {
    final GoogleMapController mapController = await googleMapController.future;
    mapController.animateCamera(
      CameraUpdate.newLatLngZoom(latLng, 15),
    );
  }
}
