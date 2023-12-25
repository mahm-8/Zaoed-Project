import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zaoed/blocs/finder_bloc/bloc/finder_bloc.dart';

import '../model/bookmark_model.dart';

class SupabaseMethods {
  final supabase = Supabase.instance.client;
  List<BookmarkModel> allBookmarks = [];

  //
  getBookmark() async {
    final bookmarkData =
        await supabase.from("bookmark").select("*").eq("id_auth", id!);
    allBookmarks.clear();
    for (var element in bookmarkData) {
      allBookmarks.add(BookmarkModel.fromJson(element));
    }
    return allBookmarks;
  }

  addBookmark(Map body) async {
    await supabase.from("bookmark").insert(body).select();
  }

  removeBookmark({required int? id}) async {
    await supabase.from("bookmark").delete().eq("id", id!);
  }
}
