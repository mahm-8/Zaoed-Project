import 'package:zaoed/constants/imports.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.isMine,
    required this.message,
  });
  final bool isMine;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Align(
        alignment: isMine ? Alignment.centerLeft : Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: context.getWidth(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.5, horizontal: 20),
                      decoration: BoxDecoration(
                          color: AppColors().gray6,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(25),
                            topRight: const Radius.circular(25),
                            bottomLeft: isMine
                                ? const Radius.circular(0)
                                : const Radius.circular(25),
                            bottomRight: isMine
                                ? const Radius.circular(25)
                                : const Radius.circular(0),
                          )),
                      child: Text(
                        message.trim(),
                        style: TextStyle(
                            color: AppColors().mainWhite,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "15:00",
                    style: TextStyle(
                      color: AppColors().mainWhite,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              // alignment: Alignment.center,
              height: 38,
              width: 38,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  blurStyle: BlurStyle.outer,
                  blurRadius: 7,
                  spreadRadius: 1,
                  color: AppColors().shadowGreen,
                ),
              ], shape: BoxShape.circle, color: AppColors().green),
              child: isMine
                  ? const ImageIcon(
                      AssetImage("lib/assets/icons/user_icon.png"),
                    )
                  : const ImageIcon(
                      AssetImage("lib/assets/icons/support-dark.png"),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
