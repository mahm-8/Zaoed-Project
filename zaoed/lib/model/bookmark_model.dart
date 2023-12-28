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
    required this.rating,
    required this.pointName,
    required this.portCount,
    required this.chargingPort,
    required this.chargingTimes,
    required this.pointLocation,
  });
  late final double? rating;
  late final String? pointName;
  late final int? portCount;
  late final String? chargingPort;
  late final int? chargingTimes;
  late final String? pointLocation;
  late final double? longitude;
  late final double? latitude;

  ChargingPoint.fromJson(Map<String, dynamic> json) {
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
    final data = <String, dynamic>{};
    data['rating'] = rating;
    data['point_name'] = pointName;
    data['port_count'] = portCount;
    data['charging_port'] = chargingPort;
    data['charging_times'] = chargingTimes;
    data['point_location'] = pointLocation;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }
}
