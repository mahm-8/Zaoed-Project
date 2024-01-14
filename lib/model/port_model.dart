class PortModel {
  int? id;
  IdChargingPoint? idChargingPoint;
  String? portName;
  int? numberOfPort;

  PortModel({this.id, this.idChargingPoint, this.portName, this.numberOfPort});

  PortModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idChargingPoint = json['id_charging_point'] != null
        ? IdChargingPoint.fromJson(json['id_charging_point'])
        : null;
    portName = json['port_name'];
    numberOfPort = json['number_of_port'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (idChargingPoint != null) {
      data['id_charging_point'] = idChargingPoint!.toJson();
    }
    data['port_name'] = portName;
    data['number_of_port'] = numberOfPort;
    return data;
  }
}

class IdChargingPoint {
  bool? booked;
  double? rating;
  String? idAuth;
  int? idUser;
  int? rateId;
  double? latitude;
  int? pointId;
  double? longitude;
  String? pointName;
  int? portCount;
  String? arrivelHour;
  String? chargingPort;
  int? chargingTimes;

  IdChargingPoint(
      {this.booked,
      this.rating,
      this.idAuth,
      this.idUser,
      this.rateId,
      this.latitude,
      this.pointId,
      this.longitude,
      this.pointName,
      this.portCount,
      this.arrivelHour,
      this.chargingPort,
      this.chargingTimes});

  IdChargingPoint.fromJson(Map<String, dynamic> json) {
    booked = json['booked'];
    rating = json['rating'];
    idAuth = json['id_auth'];
    idUser = json['id_user'];
    rateId = json['rate_id'];
    latitude = json['latitude'];
    pointId = json['point_id'];
    longitude = json['longitude'];
    pointName = json['point_name'];
    portCount = json['port_count'];
    arrivelHour = json['arrivel_hour'];
    chargingPort = json['charging_port'];
    chargingTimes = json['charging_times'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['booked'] = booked;
    data['rating'] = rating;
    data['id_auth'] = idAuth;
    data['id_user'] = idUser;
    data['rate_id'] = rateId;
    data['latitude'] = latitude;
    data['point_id'] = pointId;
    data['longitude'] = longitude;
    data['point_name'] = pointName;
    data['port_count'] = portCount;
    data['arrivel_hour'] = arrivelHour;
    data['charging_port'] = chargingPort;
    data['charging_times'] = chargingTimes;
    return data;
  }
}
