import 'package:zaoed/model/bookmark_model.dart';
import 'package:zaoed/service/networking.dart';

class ActionSupabaseMethods {
  final supabase = SupabaseNetworking().getSupabase;

  List<BookmarkModel> bookmarkList = [];

  //method to get

  getBookmarks() async {
    //*, charging_point(point_name,point_location, charging_port, port_count, rating, charging_times)

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
      return;
    }
  }

  addBookmark(Map body) async {
    // take bookmark id
    await supabase.from("bookmark").insert(body).select();
  }

  deleteBookmark({required int? id}) async {
    // take bookmark id
    await supabase.from("bookmark").delete().eq("bookmark_id", id!);
  }
}
