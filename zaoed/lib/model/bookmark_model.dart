class BookmarkModel {
  BookmarkModel({
    required this.bookmarkId,
    required this.pointId,
    required this.idAuth,
    required this.chargingPoint,
  });
  late final int bookmarkId;
  late final int pointId;
  late final String idAuth;
  late final ChargingPoint chargingPoint;

  BookmarkModel.fromJson(Map<String, dynamic> json) {
    bookmarkId = json['bookmark_id'];
    pointId = json['point_id'];
    idAuth = json['id_auth'];
    chargingPoint = ChargingPoint.fromJson(json['charging_point']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['bookmark_id'] = bookmarkId;
    data['point_id'] = pointId;
    data['id_auth'] = idAuth;
    data['charging_point'] = chargingPoint.toJson();
    return data;
  }
}

class ChargingPoint {
  ChargingPoint({
    required this.pointId,
    required this.userId,
    required this.rating,
    required this.pointName,
    required this.portCount,
    required this.chargingPort,
    required this.chargingTimes,
    required this.pointLocation,
    required this.longitude,
    required this.latitude,
  });
  late final int? pointId;
  late final int? userId;

  late final double? rating;
  late final String? pointName;
  late final int? portCount;
  late final String? chargingPort;
  late final int? chargingTimes;
  late final String? pointLocation;
  late final double longitude;
  late final double latitude;

  ChargingPoint.fromJson(Map<String, dynamic> json) {
    pointId = json['point_id'] ?? 0;
    userId = json['id_user'] ?? 0;
    rating = json['rating'] ?? 0.0;
    pointName = json['point_name'];
    portCount = json['port_count'];
    chargingPort = json['charging_port'];
    chargingTimes = json['charging_times'];
    pointLocation = json['point_location'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['point_id'] = pointId;
    _data['id_user'] = userId;
    _data['rating'] = rating;
    _data['point_name'] = pointName;
    _data['port_count'] = portCount;
    _data['charging_port'] = chargingPort;
    _data['charging_times'] = chargingTimes;
    _data['point_location'] = pointLocation;
    _data['longitude'] = longitude;
    _data['latitude'] = latitude;
    return _data;
  }
}
