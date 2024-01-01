part of 'google_map_bloc.dart';
abstract class GoogleMapState {}

final class GoogleMapInitial extends GoogleMapState {}

class GoogleMapUpdatedState extends GoogleMapState {
  final LocationDataModel locationData;

  GoogleMapUpdatedState(this.locationData);
}

class FetchPolylineState extends GoogleMapState {
  // final LatLng? distention;
  final Set<Polyline> polylines;
  final Set<Marker> markers;

  FetchPolylineState(this.polylines, this.markers);
}

class MarkerLoadingState extends GoogleMapState {}

class MarkerLoadedState extends GoogleMapState {
  final Set<Marker> markers;

  MarkerLoadedState(this.markers);
}

class PolylineLoadedState extends GoogleMapState {
  final Set<Marker> markers;

  PolylineLoadedState(this.markers);
}
