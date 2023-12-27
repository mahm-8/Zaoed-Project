import 'package:zaoed/constants/imports.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final chatController = TextEditingController();
  // final UserModel user;

  @override
  Widget build(BuildContext context) {
    final chat = context.read<ChatBloc>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: customAppBar(context, title: "الدعم", backTitle: "الرئيسية",
            onPress: () {
          context.push(view: const HomeScreen());
        }, hasAction: true, showIcon: true),
        backgroundColor: AppColors().gray9,
        bottomSheet: ChatField(
          controller: chatController,
          toUserId: "9d4faf03-ec42-4f57-81e4-ce745039ba6a",
        ),
        body: Column(
          children: [
            Divider(
              color: AppColors().gray6,
              thickness: 1,
            ),
            StreamBuilder(
              stream: chat.getMessages("9d4faf03-ec42-4f57-81e4-ce745039ba6a"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<MessageModel> messages = snapshot.data!;
                  print(messages);
                  ScrollController scrollController = ScrollController();

                  Future.delayed(const Duration(milliseconds: 100 ~/ 60), () {
                    scrollController.animateTo(
                        scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.linear);
                  });

                  return ListView.builder(
                      padding: const EdgeInsets.only(bottom: 100),
                      shrinkWrap: true,
                      controller: scrollController,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return MessageWidget(
                            message: messages[index].contents ??
                                "أهلا بك في خدمة الدعم لزوِّد",
                            isMine: messages[index].isMain ?? false);
                      });
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
