import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/model/google_map_model.dart';
import 'package:zaoed/service/networking.dart';
import 'package:image/image.dart' as IMG;
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
    print("====================wadha no 1=============");
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyB_pskxOAYeFwmfRTn-nQRRVocOj1Dyj6I',
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(sourceLocation1.latitude, sourceLocation1.longitude),
    );
    print("=========================");
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
      markers =
          createMarkers(chargingPoints, BitmapDescriptor.fromBytes(smallimg!));
      emit(FetchPolylineState(polylines, markers));
      // await getCurrentLocation();
      print(polylines.last);
    } catch (error) {
      print("!!!!!!!!!!!!!!!!!!!!!!!!!");
      print(error);
    }
  }

  getCurrentLocation() {
    location.getLocation().then((location) {
      currentLocation = location;
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
