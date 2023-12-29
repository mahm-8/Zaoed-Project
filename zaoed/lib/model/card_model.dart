
class CardModel {
    int? id;
    String? name;
    String? numberCard;
    String? expCard;
    String? csv;
    String? idUser;

    CardModel({this.id, this.name, this.numberCard, this.expCard, this.csv, this.idUser});

    CardModel.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        name = json["name"];
        numberCard = json["number_card"];
        expCard = json["exp_card"];
        csv = json["csv"];
        idUser = json["id_user"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data["id"] = id;
        data["name"] = name;
        data["number_card"] = numberCard;
        data["exp_card"] = expCard;
        data["csv"] = csv;
        data["id_user"] = idUser;
        return data;
    }
}