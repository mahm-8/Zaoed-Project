class BookmarkModel {
  int? id;
  String? bookmarkName;
  double? rating;
  int? chrgingTimes;
  String? location;
  String? idAuth;

  BookmarkModel(
      {this.id,
      this.bookmarkName,
      this.rating,
      this.chrgingTimes,
      this.location,
      this.idAuth});

  BookmarkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    bookmarkName = json['bookmark_name'] ?? "";
    rating = json['rating'] ?? "";
    chrgingTimes = json['charging_times'] ?? "";
    location = json['location'] ?? "";
    idAuth = json['id_auth'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bookmark_name'] = bookmarkName;
    data['rating'] = rating;
    data['charging_times'] = chrgingTimes;
    data['location'] = location;
    data['id_auth'] = idAuth;
    return data;
  }
}
