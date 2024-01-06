import 'package:zaoed/constants/imports.dart';

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
  late Set<Polyline> polylines = {};
  Completer<GoogleMapController> googleMapController = Completer();
  var markerIcon = BitmapDescriptor.defaultMarker;
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    location = Location();
    cameraPosition = const CameraPosition(
      target: LatLng(0, 0),
      zoom: 20,
    );
    getCurrentLocation();
  }

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
      CameraUpdate.newLatLngZoom(latLng, 15),
    );
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
              return BlocBuilder<GoogleMapBloc, GoogleMapState>(
                buildWhen: (previous, current) {
                  if (current is FetchPolylineState) {
                    return true;
                  }
                  if (current is MarkerLoadedState) {
                    return true;
                  }
                  return false;
                },
                builder: (context, state) {
                  if (state is FetchPolylineState) {
                    return GoogleMap(
                      initialCameraPosition: cameraPosition!,
                      mapType: MapType.normal,
                      markers: state.markers,
                      zoomControlsEnabled: false,
                      polylines: state.polylines,
                      onMapCreated: (GoogleMapController controller) {
                        if (!googleMapController.isCompleted) {
                          googleMapController.complete(controller);
                          setMapStyle(controller, snapshot.data.toString());
                        }
                      },
                    );
                  }
                  if (state is MarkerLoadedState) {
                    return GoogleMap(
                      initialCameraPosition: cameraPosition!,
                      mapType: MapType.normal,
                      markers: state.markers,
                      zoomControlsEnabled: false,
                      onMapCreated: (GoogleMapController controller) {
                        if (!googleMapController.isCompleted) {
                          googleMapController.complete(controller);
                          setMapStyle(controller, snapshot.data.toString());
                        }
                      },
                    );
                  }
                  return Center(
                      child: CircularProgressIndicator(
                    color: AppColors().green,
                    strokeAlign: CircularProgressIndicator.strokeAlignCenter,
                    strokeWidth: 6,
                    strokeCap: StrokeCap.round,
                  ));
                },
              );
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
