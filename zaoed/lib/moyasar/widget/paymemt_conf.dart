import 'package:moyasar/src/models/apple_pay_config.dart';
import 'package:moyasar/src/models/credit_card_config.dart';

/// Used by Moyasar API along with any of the supported sources.
class PaymentConfi {
  static String callbackUrl = "https://example.com/thanks";

  late String publishableApiKey;

  late int amount;

  String currency;

  String description;

  Map<String, String>? metadata;

  ApplePayConfig? applePay;

  CreditCardConfig? creditCard;

  PaymentConfi(
      {required this.publishableApiKey,
      required this.amount,
      this.currency = 'SAR',
      required this.description,
      this.metadata,
      this.applePay,
      this.creditCard})
      : assert(publishableApiKey.isNotEmpty,
            'Please fill `publishableApiKey` argument with your key.'),
        assert(amount > 0, 'Please add a positive amount.'),
        assert(description.isNotEmpty, 'Please add a description.');
}
