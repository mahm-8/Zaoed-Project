
import 'package:flutter/material.dart';
import 'package:moyasar/moyasar.dart';

class PaymentMethods extends StatelessWidget {
  PaymentMethods({
    super.key,
  });

  final paymentConfig = PaymentConfig(
    publishableApiKey: 'pk_test_K78biLZJNmBoMGzB44BN4B3yKoRMNCTqmfDEYvtX',
    amount: 25758, // SAR 257.58
    description: 'order #13243',
    creditCard: CreditCardConfig(saveCard: true, manual: false),
    metadata: {'size': '250g'},
  );

   onPaymentResult(result) {
    if (result is PaymentResponse) {
      switch (result.status) {
        case PaymentStatus.paid:
          
          break;
        case PaymentStatus.failed:
          // handle failure.
          break;
        case PaymentStatus.initiated:
          // TODO: Handle this case.
          break;
        case PaymentStatus.authorized:
        // TODO: Handle this case.
        case PaymentStatus.captured:
        // TODO: Handle this case.
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ApplePay(
        //   config: paymentConfig,
        //   onPaymentResult: onPaymentResult,
        // ),

        CreditCard(
          locale: Localization.ar(),
          config: paymentConfig,
          onPaymentResult: onPaymentResult,
        )
      ],
    );
  }
}
