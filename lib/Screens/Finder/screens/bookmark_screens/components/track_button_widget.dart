import 'package:zaoed/constants/imports.dart';

class TrackonGoogleButtonWidget extends StatelessWidget {
  const TrackonGoogleButtonWidget({
    super.key,
    this.onPress,
  });
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 38,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors().green, borderRadius: BorderRadius.circular(8)),
      child: IconButton(
          onPressed: onPress,
          icon: ImageIcon(
            const AssetImage(
              "lib/assets/icons/track.png",
            ),
            color: AppColors().gray9,
          )),
    );
  }
}
