import 'package:zaoed/constants/imports.dart';

class SupabaseNetworking {
  get getSupabaseInitialize async {
    final supabaseInitialize = await Supabase.initialize(
        url: dotenv.env['Url'].toString(),
        anonKey: dotenv.env['Key'].toString());
    return supabaseInitialize;
  }

  SupabaseClient get getSupabase {
    final supabase = Supabase.instance.client;
    return supabase;
  }
}
