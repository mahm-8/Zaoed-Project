import 'package:zaoed/constants/imports.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  String? gender;
  UserModel? user;
  final List<String> listgender = ["ذكر", "أنثى"];
  UserBloc() : super(UserInitial()) {
    on<GenderEvent>(selectGender);
    on<GetUserDataEvent>(getUserData);
    on<UpdateUserEvent>(updateData);
    on<UploadImageEvent>(saveProfileImage);
  }

  FutureOr<void> selectGender(GenderEvent event, Emitter<UserState> emit) {
    if (listgender.contains(event.gender)) {
      gender = event.gender;
      emit(GenderState(gender: event.gender));
    }
  }

  FutureOr<void> getUserData(
      GetUserDataEvent event, Emitter<UserState> emit) async {
    try {
      user = await getUser();
    } catch (e) {
      return;
    }
  }

  Future<UserModel?> getUser() async {
    final supabase = SupabaseNetworking().getSupabase;
    final id = supabase.auth.currentUser?.id;
    try {
      await Future.delayed(const Duration(seconds: 1));
      final data = await supabase.from("user").select().eq("id_auth", id!);

      UserModel user = UserModel.fromJson(data[0]);

      return user;
    } catch (e) {
      return null;
    }
  }

  FutureOr<void> updateData(
      UpdateUserEvent event, Emitter<UserState> emit) async {
    final supabase = SupabaseNetworking().getSupabase;
    try {
      final id = supabase.auth.currentUser?.id;
      await supabase.from('user').update({
        "name": event.user?.name,
        "birthday": event.user?.birthday,
        "gender": gender ?? event.user?.gender,
        "phone": event.user?.phone,
      }).eq('id_auth', id!);
      user = await getUser();
      emit(SuccessUpdateState(msg: 'تم إضافة البيانات بنجاح'));
    } catch (e) {
      return;
    }
  }

  FutureOr<void> saveProfileImage(
      UploadImageEvent event, Emitter<UserState> emit) async {
    final supabase = SupabaseNetworking().getSupabase;
    try {
      final time = DateTime.now().millisecondsSinceEpoch;
      final idAuth = supabase.auth.currentUser!.id;

      // get image by id
      var list = await supabase.storage.from("profile_image").list();
      String? id;
      // search for name image
      for (var x in list) {
        if (x.name.startsWith(idAuth)) {
          id = x.name;
          //remove old image
          await supabase.storage.from("profile_image").remove([id]);
        }
      }

      //upload new image
      await supabase.storage.from('profile_image').uploadBinary(
          '$idAuth-$time.png', event.image,
          fileOptions: const FileOptions(upsert: true));
      await Future.delayed(const Duration(seconds: 1));
      // get url and saved on table user
      final upload = supabase.storage
          .from('profile_image')
          .getPublicUrl('$idAuth-$time.png');
      await supabase
          .from('user')
          .update({'image_profile': upload}).eq('id_auth', idAuth);
      emit(UploadImageState(upload));
      emit(PoviderImageState(upload));
    } on StorageException catch (e) {
      emit(ErrorUploadState(msg: e.message));
      emit(ErrorPoviderUploadState(msg: e.message));
    } catch (error) {
      emit(ErrorPoviderUploadState(msg: "Sorry try later after 5 min "));
      emit(ErrorUploadState(msg: "Sorry try later after 5 min "));
    }
  }
}
