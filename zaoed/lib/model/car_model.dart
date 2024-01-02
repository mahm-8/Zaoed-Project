class CarModel {
  int? id;
  String? brand;
  String? model;
  String? type;
  String? idUser;

  CarModel({this.id, this.brand, this.model, this.type, this.idUser});

  CarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    model = json['model'];
    type = json['type'];
    idUser = json['id_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['model'] = this.model;
    data['type'] = this.type;
    data['id_user'] = this.idUser;
    return data;
  }
}
