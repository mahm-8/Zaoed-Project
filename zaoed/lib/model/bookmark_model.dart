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
    this.pointId,
    this.userId,
    this.pointAuthID,
    this.rating,
    this.pointName,
    this.portCount,
    this.chargingPort,
    this.arrivelHours,
    this.chargingTimes,
    this.longitude,
    this.latitude,
    this.booked,
  });
  int? pointId;
  int? userId;
  String? pointAuthID;
  String? arrivelHours;
  double? rating;
  String? pointName;
  int? portCount;
  String? chargingPort;
  int? chargingTimes;
  double? longitude;
  double? latitude;
  bool? booked;

  ChargingPoint.fromJson(Map<String, dynamic> json) {
    pointId = json['point_id'] ?? 0;
    userId = json['id_user'] ?? 0;
    pointAuthID = json["id_auth"];
    rating = json['rating'] ?? 0.0;
    arrivelHours = json['arrivel_hour'] ?? "";
    pointName = json['point_name'] ?? "";
    portCount = json['port_count'] ?? 0;
    chargingPort = json['charging_port'];
    chargingTimes = json['charging_times'] ?? 0;
    booked = json['booked'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['point_id'] = pointId;
    data['id_user'] = userId;
    data['id_auth'] = pointAuthID;
    data['arrivel_hour'] = arrivelHours;
    data['rating'] = rating;
    data['point_name'] = pointName;
    data['port_count'] = portCount;
    data['charging_port'] = chargingPort;
    data['charging_times'] = chargingTimes;
    data['booked'] = booked;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }
}
