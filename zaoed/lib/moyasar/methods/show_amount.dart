import 'package:moyasar/moyasar.dart';

String showAmount(int amount, Localization locale) {
  final formattedAmount = (amount / 100).toStringAsFixed(2);

  if (locale.languageCode == 'en') {
    return '${locale.pay} SAR $formattedAmount';
  }

  return '${locale.pay} $formattedAmount ر.س';
}
