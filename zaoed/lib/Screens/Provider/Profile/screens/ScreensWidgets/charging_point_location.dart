import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zaoed/constants/colors.dart';

class ChargingPointLocation extends StatefulWidget {
  ChargingPointLocation({
    super.key,
  });

  @override
  State<ChargingPointLocation> createState() => _ChargingPointLocationState();
}

class _ChargingPointLocationState extends State<ChargingPointLocation> {
  Set<Marker> markerSet = {};
  double? pinLatitude;
  double? pinLongitude;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'موقع نقطة الشحن',
            style: TextStyle(color: AppColors().white, fontSize: 20),
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
                        pinLatitude = position.latitude;
                        pinLongitude = position.longitude;
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
