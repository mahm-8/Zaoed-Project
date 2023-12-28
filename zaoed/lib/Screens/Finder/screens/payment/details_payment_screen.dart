import 'package:zaoed/blocs/card_bloc/card_bloc.dart';
import 'package:zaoed/constants/imports.dart';

// ignore_for_file: must_be_immutable

class DetailsPaymentScreen extends StatelessWidget {
  DetailsPaymentScreen({
    super.key,
    required this.onTap,
    required this.type,
    required this.hour,
    required this.image,
  });
  final Function() onTap;
  int discount = 3;
  final String type;
  final String hour;
  final String image;
  @override
  Widget build(BuildContext context) {
    context.read<CardBloc>().add(GetCardDateEvent());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleLabel(
          title: 'بيانات الحجز',
        ),
        BookingDataContainer(
          type: type,
          hour: hour,
          image: image,
        ),
        const TitleLabel(
          title: 'موقع الحجز',
        ),
        const LocationDetails(),
        const TitleLabel(
          title: 'سعر الحجز',
        ),
        BookingPriceContainer(discount: discount),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ButtonWidget(
            textEntry: 'التالي',
            backColor: AppColors().green,
            onPress: onTap,
            textColor: AppColors().white,
          ),
        ),
      ],
    );
  }
}
