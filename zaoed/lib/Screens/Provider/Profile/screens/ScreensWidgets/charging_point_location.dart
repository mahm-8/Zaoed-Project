// ignore_for_file: must_be_immutable

import 'package:zaoed/constants/imports.dart';

class ChargingPointLocation extends StatefulWidget {
  ChargingPointLocation({
    super.key,
    this.bloc,
  });
  ProviderBloc? bloc;

  @override
  State<ChargingPointLocation> createState() => _ChargingPointLocationState();
}

class _ChargingPointLocationState extends State<ChargingPointLocation> {
  Set<Marker> markerSet = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'موقع نقطة الشحن',
            style: const TextStyle().style4,
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 283,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors().gray6),
            ),
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString(
                  'lib/assets/google_map_style/dark_map_style.json'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GoogleMap(
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(
                        24.600006977521694,
                        46.77827529205053,
                      ),
                      zoom: 5,
                    ),
                    mapType: MapType.normal,
                    markers: markerSet,
                    zoomControlsEnabled: false,
                    onTap: (position) {
                      setState(() {
                        markerSet = {
                          Marker(
                            markerId: const MarkerId('marker'),
                            position: position,
                          )
                        };
                        widget.bloc?.pinLatitude = position.latitude;
                        widget.bloc?.pinLongitude = position.longitude;
                      });
                    },
                    onMapCreated: (GoogleMapController controller) {
                      setMapStyle(controller, snapshot.data.toString());
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

void setMapStyle(GoogleMapController controller, String mapStyle) async {
  controller.setMapStyle(mapStyle);
}
