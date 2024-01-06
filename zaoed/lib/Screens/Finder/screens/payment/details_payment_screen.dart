import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/constants/imports.dart';

// ignore_for_file: must_be_immutable

class DetailsPaymentScreen extends StatelessWidget {
  DetailsPaymentScreen({
    super.key,
    required this.onTap,
    required this.type,
    required this.hour,
    required this.image,
    required this.totalPrice,
    required this.chargingPoint,
  });
  final Function() onTap;
  int discount = 0;
  final String type;
  final String hour;
  final String image;
  final double totalPrice;
  final ChargingPoint? chargingPoint;
  TextEditingController caponController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ActionsBloc>();
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
        LocationDetails(
          namePoint: chargingPoint?.pointName ?? "",
        ),
        const TitleLabel(
          title: 'كود الخصم',
        ),
        CaponWidget(caponController: caponController, price: bloc.price!),
        const TitleLabel(
          title: 'سعر الحجز',
        ),
        BookingPriceContainer(
          discount: discount,
          hour: hour,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ButtonWidget(
            textEntry: 'التالي',
            backColor: AppColors().green,
            onPress: onTap,
            textColor: AppColors().gray9,
          ),
        ),
      ],
    );
  }
}
