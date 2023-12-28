import 'dart:developer';

import 'package:moyasar/moyasar.dart';
import 'package:zaoed/Screens/Finder/screens/payment/widgets/view_web.dart';
import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/test_pay.dart';

class PaymentProcessScreen extends StatefulWidget {
  const PaymentProcessScreen({super.key, required this.type, required this.hour, required this.image});
 final String type;
  final String hour;
  final String image;
  @override
  State<PaymentProcessScreen> createState() => _PaymentProcessScreenState();
}

class _PaymentProcessScreenState extends State<PaymentProcessScreen> {
  int activeStep = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: profileScreenAppBar(context, title: 'الدفع'),
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
                  }, type: widget.type, hour: widget.hour, image: widget.image,
                ),
              ],
              if (activeStep == 1) ...[
                PurchaseScreen(
                  onTap: () async {
                    String state = '';
                    final source = CardPaymentRequestSource(
                        creditCardData: CardFormModel(
                            name: 'John Doe',
                            number: '4201320111111010',
                            month: '05',
                            year: '2024',
                            cvc: '000'),
                        tokenizeCard: (PaymentMethods().paymentConfig.creditCard
                                as CreditCardConfig)
                            .saveCard,
                        manualPayment: (PaymentMethods()
                                .paymentConfig
                                .creditCard as CreditCardConfig)
                            .manual);

                    final paymentRequest =
                        PaymentRequest(PaymentMethods().paymentConfig, source);

                    final result = await Moyasar.pay(
                        apiKey:
                            PaymentMethods().paymentConfig.publishableApiKey,
                        paymentRequest: paymentRequest);
                    final String transactionUrl =
                        (result.source as CardPaymentResponseSource)
                            .transactionUrl;

                    if (mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            fullscreenDialog: true,
                            maintainState: false,
                            builder: (context) => ThreeDSWebView(
                                transactionUrl: transactionUrl,
                                on3dsDone:
                                    (String status, String message) async {
                                  if (status == PaymentStatus.paid.name) {
                                    state = "paid";
                                    result.status = PaymentStatus.paid;
                                  } else if (status ==
                                      PaymentStatus.authorized.name) {
                                    state = "authorized";
                                    result.status = PaymentStatus.authorized;
                                  } else {
                                    state = "failed";
                                    result.status = PaymentStatus.failed;
                                    (result.source as CardPaymentResponseSource)
                                        .message = message;
                                  }
                                  Navigator.pop(context);
                                  print("================");
                                  print(state);
                                  PaymentMethods().onPaymentResult(result);
                                  if (state == "paid") {
                                    setState(() {
                                      activeStep = 2;
                                    });
                                  }
                                })),
                      );
                    }
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
