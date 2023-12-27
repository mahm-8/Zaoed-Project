import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:image/image.dart' as IMG;

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  CameraPosition? cameraPosition;
  Location? location;
  LocationData? currentLocation;
  bool isDark = false;
  late Set<Marker> markers = {}; //
  late Set<Polyline> polylines = {};
  Completer<GoogleMapController> googleMapController = Completer();
  var markerIcon = BitmapDescriptor.defaultMarker;
  @override
  void initState() {
    super.initState();

    addCustomIcon();
    init();
  }

  void addCustomIcon() async {
    Uint8List bytes = (await rootBundle.load('lib/assets/icons/pin.png'))
        .buffer
        .asUint8List();

    Uint8List? smallimg = resizeImage(bytes, 70, 70);
    setState(() {
      markers = createMarkers(BitmapDescriptor.fromBytes(smallimg!));
    });
  }

  Uint8List? resizeImage(Uint8List data, width, height) {
    Uint8List? resizedData = data;
    IMG.Image? img = IMG.decodeImage(data);
    IMG.Image resized = IMG.copyResize(img!, width: width, height: height);
    resizedData = Uint8List.fromList(IMG.encodePng(resized));
    return resizedData;
  }

  init() async {
    location = Location();
    cameraPosition = const CameraPosition(
      target: LatLng(0, 0),
      zoom: 15,
    );
    getCurrentLocation();
    final LatLng sourceLocation = LatLng(24.82434094026811, 46.715431292126944);
    final LatLng sourceLocation1 =
        LatLng(24.82434094026811, 46.715431292126944);
    final LatLng destination = LatLng(24.82434094026811, 46.715431292126944);
    polylines =
        await createPolylines(sourceLocation, sourceLocation1, destination);
  }

//24.82434094026811, 46.715431292126944
  getCurrentLocation() {
    location?.getLocation().then((location) {
      currentLocation = location;
    });
    location?.onLocationChanged.listen((newLocation) {
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
      CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 15),
      ),
    );
  }

  Future<Set<Polyline>> createPolylines(
    LatLng sourceLocation,
    LatLng sourceLocation1,
    LatLng destination,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _getMap();
  }

  Widget _getMap() {
    return Stack(
      children: [
        FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('lib/assets/google_map_style/dark_map_style.json'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (polylines != {}) {
                return GoogleMap(
                  initialCameraPosition: cameraPosition!,
                  mapType: MapType.normal,
                  markers: markers,
                  zoomControlsEnabled: false,
                  polylines: polylines,
                  onMapCreated: (GoogleMapController controller) {
                    if (!googleMapController.isCompleted) {
                      googleMapController.complete(controller);
                      setMapStyle(controller, snapshot.data.toString());
                    }
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: getMarker(),
          ),
        ),
      ],
    );
  }

  void setMapStyle(GoogleMapController controller, String mapStyle) async {
    controller.setMapStyle(mapStyle);
  }

  Set<Marker> createMarkers(BitmapDescriptor markerIcon) {
    final Marker marker1 = Marker(
      markerId: const MarkerId('1'),
      position: LatLng(37.4219983, -122.084),
      icon: markerIcon,
    );

    final Marker marker2 = Marker(
      markerId: const MarkerId('2'),
      position: LatLng(37.33429383, -122.0660055),
      icon: markerIcon,
    );

    final Marker marker3 = Marker(
      markerId: const MarkerId('3'),
      position: LatLng(37.33500303, -122.03272188),
      icon: markerIcon,
    );

    return {marker1, marker2, marker3};
  }

  Widget getMarker() {
    return Container(
      width: 10,
      height: 10,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColors().green,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 3),
            spreadRadius: 4,
            blurRadius: 6,
          ),
        ],
      ),
    );
  }
}
