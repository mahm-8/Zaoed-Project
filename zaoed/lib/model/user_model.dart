class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? birthday;
  String? gender;
  String? location;
  String? idAuth;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.birthday,
      this.gender,
      this.location,
      this.idAuth});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    phone = json['phone'] ?? "";
    birthday = json['birthday'] ?? "";
    gender = json['gender'] ?? "";
    location = json['location'] ?? "";
    idAuth = json['id_auth'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['email'] = email;
    data['id_auth'] = idAuth;
    return data;
  }
}
