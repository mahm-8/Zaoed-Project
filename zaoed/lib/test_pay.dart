import 'package:moyasar/moyasar.dart';
import 'package:zaoed/blocs/finder_bloc/finder_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class PaymentMethods extends StatelessWidget {
  PaymentMethods({
    super.key,
  });

  final paymentConfig = PaymentConfig(
    publishableApiKey: 'sk_test_WV8xzDhDfPDVq8UzSivsBUUBF5CebbhknDsF6uPo',
    amount: 25758, // SAR 257.58
    description: 'order #13243',
    creditCard: CreditCardConfig(saveCard: true, manual: false),
    metadata: {'size': '250g'},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CreditCard(
              locale: const Localization.ar(),
              config: paymentConfig,
              onPaymentResult: onPaymentResult,
            ),
          )
        ],
      ),
    );
  }

  onPaymentResult(result, BuildContext context) {
    if (result is PaymentResponse) {
      switch (result.status) {
        case PaymentStatus.paid:
          context.read<FinderBloc>().add(PaymentStatusEvent("paid"));
          break;
        case PaymentStatus.failed:
          print("faild");
          context.read<FinderBloc>().add(PaymentStatusEvent("faild"));
          break;
        case PaymentStatus.initiated:
          // TODO: Handle this case.
          print("initated");
          break;
        case PaymentStatus.authorized:
          context.read<FinderBloc>().add(PaymentStatusEvent("authorized"));
        // TODO: Handle this case.
        case PaymentStatus.captured:
        // TODO: Handle this case.
      }
    }
  }
}
