import 'package:zaoed/model/bookmark_model.dart';
import 'package:zaoed/service/networking.dart';

class ActionSupabaseMethods {
  final supabase = SupabaseNetworking().getSupabase;

  List<BookmarkModel> bookmarkList = [];
  List<ChargingPoint> chargingPointList = [];
  getBookmarks() async {
    try {
      final id = supabase.auth.currentUser?.id;
      final bookmarkData = await supabase
          .from("bookmark")
          .select(
              "*, charging_point(point_name,point_location, charging_port, port_count, rating, charging_times, longitude, latitude)")
          .eq("id_auth", id!);
      for (var element in bookmarkData) {
        bookmarkList.add(BookmarkModel.fromJson(element));
      }
      return bookmarkList;
    } catch (e) {
      print(e.toString());
    }
  }

  addBookmark(Map body) async {
    // take bookmark id
    await supabase.from("bookmark").insert(body).select();
  }

  deleteBookmark({required int? id}) async {
    await supabase.from("bookmark").delete().eq("bookmark_id", id!);
  }

  getChargingPoint() async {
    final id = supabase.auth.currentUser?.id;
    final chargingPointData = await supabase
        .from("charging_point")
        .select("* , port_counter(port_name, number_of_port)")
        .eq("auth_id", id!);
    for (var element in chargingPointData) {
      chargingPointList.add(ChargingPoint.fromJson(element));
    }
    return chargingPointList;
  }

  deleteChargingPoint({required int? id}) async {
    // get id??
    await supabase.from("charging_point").delete().eq("point_id", id!);
  }
}
