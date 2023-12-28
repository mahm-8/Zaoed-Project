part of 'google_map_bloc.dart';

@immutable
sealed class GoogleMapEvent {}

class LoadMarkersEvent extends GoogleMapEvent {}

class FetchMarkersEvent extends GoogleMapEvent {}
// class LocationUpdatedEvent extends GoogleMapEvent {
//   final LocationDataModel locationData;

//    LocationUpdatedEvent(this.locationData);

// }

class FetchPolylineEvent extends GoogleMapEvent {
  final LatLng source;
  final LatLng distention;

  FetchPolylineEvent({required this.source, required this.distention});

}
