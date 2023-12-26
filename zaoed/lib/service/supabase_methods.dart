import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zaoed/blocs/finder_bloc/bloc/finder_bloc.dart';

import '../model/bookmark_model.dart';

class SupabaseMethods {
  final supabase = Supabase.instance.client;
  List<BookmarkModel> allBookmarks = [];

  //method to get

  getProfit() async {
    try {
      // final id =supabase.auth.currentUser?.id;
      final dailyProfit = await supabase.from("invoice_test").select('''
select
  i.id as invoice_id,
  i.token,
  i.tax,
  i.amount,
  u.id_auth as provider_id,
  i.day,
  i.date,
  i.time,
  (sum(i.amount - i.tax) / sum(i.amount)) * 100 as profit_percentage
from
  invoice i
  join "user" u on i.id_user = u.id_auth
where
  u.type = 'provider'
group by
  i.id, u.id_auth;
 ''');
      print(dailyProfit);
      return dailyProfit;
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  // old methods
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
