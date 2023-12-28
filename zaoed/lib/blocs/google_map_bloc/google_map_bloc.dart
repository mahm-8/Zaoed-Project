import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/model/google_map_model.dart';
import 'package:zaoed/service/networking.dart';
import 'package:image/image.dart' as IMG;

part 'google_map_event.dart';
part 'google_map_state.dart';

class GoogleMapBloc extends Bloc<GoogleMapEvent, GoogleMapState> {
  final Location location = Location();
  List chargingPoints = [];
  GoogleMapBloc() : super(GoogleMapInitial()) {
    final supabase = SupabaseNetworking().getSupabase;

    on<FetchMarkersEvent>((event, emit) async {
      // emit(MarkerLoadingState());

      final response = await supabase
          .from('charging_point')
          .select('point_id,latitude,longitude');
      print(response);

      for (var element in response) {
        chargingPoints.add(element);
      }
      print('111111111111111111');
      print(chargingPoints);
      if (chargingPoints != []) {
        print(chargingPoints);
        Uint8List bytes = (await rootBundle.load('lib/assets/icons/pin.png'))
            .buffer
            .asUint8List();
        Uint8List? smallimg = resizeImage(bytes, 70, 70);
        print('ssssssssssssssssssss');
        print(smallimg);
        Set<Marker> markers = {};
        markers = createMarkers(
            chargingPoints, BitmapDescriptor.fromBytes(smallimg!));
        emit(MarkerLoadedState(markers));
      }
    });

    on<FetchPolylineEvent>((event, emit) {
      
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
    print('gggggggggggggggggggggggggggggggggggggg');
    print(markers);
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
}
