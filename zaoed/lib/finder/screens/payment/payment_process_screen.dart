import 'package:flutter/material.dart';
import 'package:zaoed/Provider/Screens/Profile/screens/AppBar/profail_screens_app_bar.dart';
import 'package:zaoed/components/button_widget.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/finder/screens/payment/bill_screen.dart';
import 'package:zaoed/finder/screens/payment/purchase_screen.dart';
import 'package:zaoed/finder/screens/payment/widgets/booking_data_container.dart';
import 'package:zaoed/finder/screens/payment/widgets/booking_price_container.dart';
import 'package:zaoed/finder/screens/payment/widgets/location_details.dart';
import 'package:zaoed/finder/screens/payment/widgets/progress_bar.dart';
import 'package:zaoed/finder/screens/payment/widgets/title_label.dart';

class PaymentProcessScreen extends StatefulWidget {
  const PaymentProcessScreen({super.key});

  @override
  State<PaymentProcessScreen> createState() => _PaymentProcessScreenState();
}

class _PaymentProcessScreenState extends State<PaymentProcessScreen> {
  int activeStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: ProfailScreenAppBar(context, title: 'الدفع'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressBar(progress: 0.2, activeStep: activeStep),
              if (activeStep == 0) ...[
                DetailsPaymentScreen(
                  onTap: () {
                    setState(() {
                      activeStep = 1;
                    });
                  },
                ),
              ],
              if (activeStep == 1) ...[
                PurchaseScreen(
                  onTap: () {
                    setState(() {
                      activeStep = 2;
                    });
                  },
                ),
              ],
              if (activeStep == 2) ...[
                BillScreen(
                  onTap: () {
                    setState(() {
                      activeStep = 3;
                    });
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsPaymentScreen extends StatelessWidget {
  final Function() onTap;

  DetailsPaymentScreen({
    required this.onTap,
  });

  late int discount = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleLabel(
          title: 'بيانات الحجز',
        ),
        BookingDataContainer(),
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
