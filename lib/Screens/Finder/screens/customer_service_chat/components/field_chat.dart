import 'package:zaoed/constants/imports.dart';

class ChatField extends StatelessWidget {
  const ChatField({
    super.key,
    required this.controller,
    required this.toUserId,
  });

  final TextEditingController controller;
  final String toUserId;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 75,
      padding: const EdgeInsets.only(left: 10, right: 10),
      width: context.getWidth(),
      decoration: BoxDecoration(color: AppColors().gray6),
      child: TextField(
        cursorColor: AppColors().gray,
        style: const TextStyle().style25,
        minLines: 1,
        maxLines: 4,
        controller: controller,
        decoration: InputDecoration(
          prefixIconColor: AppColors().mainWhite,
          suffixIconColor: AppColors().mainWhite,
          prefixIcon: const ImageIcon(
            AssetImage(
              "lib/assets/icons/uil_paperclip.png",
            ),
          ),
          hintText: "اكتب رسالتك هنا",
          hintStyle: TextStyle(color: AppColors().gray),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Container(
              height: 38,
              decoration: BoxDecoration(
                color: AppColors().gray5,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                alignment: Alignment.center,
                onPressed: () {
                  context.read<ChatBloc>().add(MessageEvent(
                      message: controller.text.trim(), idUserTo: toUserId));
                  controller.clear();
                },
                icon: const Icon(
                  Icons.send,
                  size: 22,
                ),
              ),
            ),
          ),
          filled: true,
          fillColor: AppColors().gray6,
          focusedBorder: OutlineStyle.noneBorder,
          enabledBorder: OutlineStyle.noneBorder,
        ),
      ),
    );
  }
}
