part of 'google_map_bloc.dart';

abstract class GoogleMapEvent {}

class LoadMarkersEvent extends GoogleMapEvent {}

class FetchMarkersEvent extends GoogleMapEvent {}


class FetchPolylineEvent extends GoogleMapEvent {

  final LatLng? distention;

  FetchPolylineEvent({required this.distention});
}
