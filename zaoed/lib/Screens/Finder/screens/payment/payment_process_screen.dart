import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moyasar/moyasar.dart';
import 'package:zaoed/Screens/Finder/screens/payment/widgets/view_web.dart';

import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/blocs/card_bloc/card_bloc.dart';
import 'package:zaoed/blocs/finder_bloc/finder_bloc.dart';
import 'package:zaoed/blocs/google_map_bloc/google_map_bloc.dart';

import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/test_pay.dart';

import '../../../../blocs/finder/user_bloc/user_bloc.dart';
import '../NavigationBar/navigation_bar.dart';

class PaymentProcessScreen extends StatefulWidget {
  const PaymentProcessScreen({
    super.key,
    required this.type,
    required this.hour,
    required this.image,
    double? price,
    required this.chargingPoint,
  });
  final String type;
  final String hour;
  final String image;
  final ChargingPoint chargingPoint;

  @override
  State<PaymentProcessScreen> createState() => _PaymentProcessScreenState();
}

class _PaymentProcessScreenState extends State<PaymentProcessScreen> {
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ActionsBloc>();
    final card = context.read<CardBloc>();
    final user = context.read<UserBloc>();
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
                  },
                  type: widget.type,
                  hour: widget.hour,
                  image: widget.image,
                  totalPrice: bloc.price!,
                  chargingPoint: widget.chargingPoint,
                ),
              ],
              if (activeStep == 1) ...[
                PurchaseScreen(
                  onTap: () async {
                    context.read<FinderBloc>().add(PayEvent(
                        nameFinder: user.user?.name ?? "",
                        type: widget.type,
                        amount: bloc.price ?? 0.0,
                        providerName: widget.chargingPoint.pointName ?? "",
                        address:
                            "${widget.chargingPoint.latitude},${widget.chargingPoint.longitude}"));
                    context.read<FinderBloc>().add(InvoiceDataEvent());
                    context.read<GoogleMapBloc>().add(FetchPolylineEvent(
                        distention: LatLng(widget.chargingPoint.latitude!,
                            widget.chargingPoint.longitude!)));
                    // String state = '';
                    // if (card.cardList != null) {
                    //   print(card.cardList?[0].numberCard ?? '');
                    //   final source = CardPaymentRequestSource(
                    //       creditCardData: CardFormModel(
                    //           name: card.cardList?[0].name ?? '',
                    //           number: card.cardList?[0].numberCard ?? "",
                    //           month: card.cardList?[0].expCard
                    //                   .toString()
                    //                   .split("/")[0] ??
                    //               "",
                    //           year:
                    //               '20${card.cardList?[0].expCard.toString().split("/")[1] ?? '26'}',
                    //           cvc: card.cardList![0].csv ?? ""),
                    //       tokenizeCard: (PaymentMethods()
                    //               .paymentConfig
                    //               .creditCard as CreditCardConfig)
                    //           .saveCard,
                    //       manualPayment: (PaymentMethods()
                    //               .paymentConfig
                    //               .creditCard as CreditCardConfig)
                    //           .manual);
                    //   print("====$source");
                    //   final paymentRequest = PaymentRequest(
                    //       PaymentMethods().paymentConfig, source);
                    //   print("====$paymentRequest=======");
                    //   final result = await Moyasar.pay(
                    //       apiKey:
                    //           PaymentMethods().paymentConfig.publishableApiKey,
                    //       paymentRequest: paymentRequest);
                    //
                    //   print(result);
                    //   final String transactionUrl =
                    //       (result.source as CardPaymentResponseSource)
                    //           .transactionUrl;
                    //
                    //   if (mounted) {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           fullscreenDialog: true,
                    //           maintainState: false,
                    //           builder: (context) => ThreeDSWebView(
                    //               transactionUrl: transactionUrl,
                    //               on3dsDone:
                    //                   (String status, String message) async {
                    //                 if (status == PaymentStatus.paid.name) {
                    //                   state = "paid";
                    //                   result.status = PaymentStatus.paid;
                    //                 } else if (status ==
                    //                     PaymentStatus.authorized.name) {
                    //                   state = "authorized";
                    //                   result.status = PaymentStatus.authorized;
                    //                 } else {
                    //                   state = "failed";
                    //                   result.status = PaymentStatus.failed;
                    //                   (result.source
                    //                           as CardPaymentResponseSource)
                    //                       .message = message;
                    //                 }
                    //                 Navigator.pop(context);
                    //                 PaymentMethods().onPaymentResult(result);
                    // if (state == "paid") {
                    setState(() {
                      activeStep = 2;
                    });
                    // }
                    // })),
                    //   );
                    // }
                    // } else {
                    //   context.showErrorMessage(msg: "choose your card (^_^)");
                    // }
                  },
                ),
              ],
              if (activeStep == 2) ...[
                BillScreen(
                  onTap: () {
                    context.pushAndRemoveUntil(
                        view: FinderNavigationBarScreen());
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
