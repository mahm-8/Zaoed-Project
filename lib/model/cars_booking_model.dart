class CarBookingModel {
  CarBookingModel({
    required this.id,
    required this.createdAt,
    required this.idAuth,
    required this.idCars,
    required this.hours,
    required this.idPovider,
    required this.status,
    required this.timer,
    required this.idPoint,
  });

  final int? id;
  final DateTime? createdAt;
  final String? idAuth;
  final int? idCars;
  final int? hours;
  final String? idPovider;
  final String? status;
  final DateTime? timer;
  final int? idPoint;

  factory CarBookingModel.fromJson(Map<String, dynamic> json) {
    return CarBookingModel(
      id: json["id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      idAuth: json["id_auth"] ?? "",
      idCars: json["id_cars"] ?? 0,
      hours: json["hours"] ?? "",
      idPovider: json["id_povider"] ?? "",
      status: json["status"] ?? "",
      timer: DateTime.tryParse(json["timer"] ?? ""),
      idPoint: json["id_point"] ?? 0,
    );
  }
}
