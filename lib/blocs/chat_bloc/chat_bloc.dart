import 'package:zaoed/constants/imports.dart';
part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<GetUserChatEvent>(getUsers);
    on<GetAdminChatEvent>(getAdmin);
    on<MessageEvent>(sendMessage);
    on<GetScreenChatEvent>(sendNumber);
  }
  final supabase = Supabase.instance.client;

  String get getCurrentUserId => supabase.auth.currentUser!.id;

  getUsers(GetUserChatEvent event, Emitter<ChatState> emit) async {
    try {
      final List allUsers =
          await supabase.from("user").select().eq("type", 'finder');
      final List<UserModel> users =
          allUsers.map((user) => UserModel.fromJson(user)).toList();
      emit(GetUsersSuccessedState(users));
    } catch (e) {
      emit(ErrorGetUsersState());
    }
  }

  getAdmin(GetAdminChatEvent event, Emitter<ChatState> emit) async {
    try {
      final List data =
          await supabase.from("user").select().match({"type": "admin"});
      final List<UserModel> users =
          data.map((user) => UserModel.fromJson(user)).toList();
      emit(GetAdminSuccessedState(admin: users));
    } catch (e) {
      return;
    }
  }

  sendMessage(MessageEvent event, emit) async {
    try {
      await supabase.from("chats").insert({
        "contents": event.message,
        "id_from": getCurrentUserId,
        "id_to": event.idUserTo
      });
    } catch (e) {
      return;
    }
  }

  Stream getMessages(String toUserId) {
    final allMesages = supabase
        .from("chats")
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: true)
        .map((items) => items.where((element) =>
            element["id_from"] == getCurrentUserId &&
                element["id_to"] == toUserId ||
            element["id_from"] == toUserId &&
                element["id_to"] == getCurrentUserId));

    final messages = allMesages.map((items) => items
        .map((item) => MessageModel.fromJson(item, getCurrentUserId))
        .toList());

    return messages;
  }

  FutureOr<void> sendNumber(GetScreenChatEvent event, Emitter<ChatState> emit) {
    emit(ScreenChatState(event.ind));
  }
}
