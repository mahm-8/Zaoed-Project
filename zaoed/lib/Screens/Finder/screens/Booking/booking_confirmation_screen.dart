import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen(
      {super.key, required this.type, required this.hour, required this.image, required this.price});
  final String type;
  final String hour;
  final String image;
  final double price;
  @override
  Widget build(BuildContext context) {
   final bloc = context.read<ActionsBloc>();
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: profileScreenAppBar(context, title: 'تأكيد الحجز'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Container(
              height: 267,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors().gray6),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BookingLocationInformation(),
                      BookingChargingInformation(
                        type: type,
                        image: image,
                      ),
                      BookingChargingTimeInformation(
                        hour: hour,
                      ),
                    ]),
              ),
            ),
            const Spacer(),
            ButtonWidget(
                textEntry: 'تأكيد',
                backColor: AppColors().green,
                onPress: () {
                  context.push(
                      view: PaymentProcessScreen(
                    type: type,
                    hour: hour,
                    image: image, price: bloc.price,
                  ));
                },
                textColor: AppColors().gray8)
          ],
        ),
      ),
    );
  }
}
