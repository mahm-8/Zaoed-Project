import 'package:zaoed/constants/imports.dart';

class ButtonChoiceWidget extends StatelessWidget {
  const ButtonChoiceWidget({
    super.key,
    required this.imageUrl,
    this.onPress,
  });

  final String imageUrl;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPress,
        child: Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: AppColors().gray1Trans,
            borderRadius: BorderRadius.circular(24),
            border: Border.fromBorderSide(
                BorderSide(color: AppColors().green, width: 0.4)),
          ),
          child: Image.asset(imageUrl),
        ).asGlass(clipBorderRadius: BorderRadius.circular(24)));
  }
}
