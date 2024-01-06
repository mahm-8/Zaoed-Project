import 'package:zaoed/constants/imports.dart';

class CrediCard extends StatefulWidget {
  const CrediCard(
      {super.key,
      required this.config,
      required this.onPaymentResult,
      this.locale = const Localization.en()});

  final Function onPaymentResult;
  final PaymentConfig config;
  final Localization locale;

  @override
  State<CrediCard> createState() => _CrediCardState();
}

class _CrediCardState extends State<CrediCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _cardData = CardFormModel();

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  bool _isSubmitting = false;

  bool _tokenizeCard = false;

  bool _manualPayment = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _tokenizeCard = widget.config.creditCard?.saveCard ?? false;
      _manualPayment = widget.config.creditCard?.manual ?? false;
    });
  }

  void _saveForm() async {
    closeKeyboard();

    bool isValidForm =
        _formKey.currentState != null && _formKey.currentState!.validate();

    if (!isValidForm) {
      setState(() => _autoValidateMode = AutovalidateMode.onUserInteraction);
      return;
    }

    _formKey.currentState?.save();

    final source = CardPaymentRequestSource(
        creditCardData: _cardData,
        tokenizeCard: _tokenizeCard,
        manualPayment: _manualPayment);
    final paymentRequest = PaymentRequest(widget.config, source);

    setState(() => _isSubmitting = true);

    final result = await Moyasar.pay(
        apiKey: widget.config.publishableApiKey,
        paymentRequest: paymentRequest);

    setState(() => _isSubmitting = false);

    if (result is! PaymentResponse ||
        result.status != PaymentStatus.initiated) {
      widget.onPaymentResult(result);
      return;
    }

    final String transactionUrl =
        (result.source as CardPaymentResponseSource).transactionUrl;

    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            maintainState: false,
            builder: (context) => ThreeDSWebView(
                transactionUrl: transactionUrl,
                on3dsDone: (String status, String message) async {
                  if (status == PaymentStatus.paid.name) {
                    result.status = PaymentStatus.paid;
                  } else if (status == PaymentStatus.authorized.name) {
                    result.status = PaymentStatus.authorized;
                  } else {
                    result.status = PaymentStatus.failed;
                    (result.source as CardPaymentResponseSource).message =
                        message;
                  }
                  Navigator.pop(context);
                  widget.onPaymentResult(result);
                })),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: _autoValidateMode,
      key: _formKey,
      child: Column(
        children: [
          CardFormField(
              inputDecoration: buildInputDecoration(
                hintText: widget.locale.nameOnCard,
              ),
              keyboardType: TextInputType.text,
              validator: (String? input) =>
                  CardUtils.validateName(input, widget.locale),
              onSaved: (value) => _cardData.name = value ?? '',
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[a-zA-Z. ]')),
              ]),
          CardFormField(
            inputDecoration: buildInputDecoration(
                hintText: widget.locale.cardNumber, addNetworkIcons: true),
            validator: (String? input) =>
                CardUtils.validateCardNum(input, widget.locale),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
              CardNumberInputFormatter(),
            ],
            onSaved: (value) =>
                _cardData.number = CardUtils.getCleanedNumber(value!),
          ),
          CardFormField(
            inputDecoration: buildInputDecoration(
              hintText: '${widget.locale.expiry} (MM / YY)',
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
              CardMonthInputFormatter(),
            ],
            validator: (String? input) =>
                CardUtils.validateDate(input, widget.locale),
            onSaved: (value) {
              List<String> expireDate = CardUtils.getExpiryDate(value!);
              _cardData.month = expireDate.first;
              _cardData.year = expireDate[1];
            },
          ),
          CardFormField(
            inputDecoration: buildInputDecoration(
              hintText: widget.locale.cvc,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
            ],
            validator: (String? input) =>
                CardUtils.validateCVC(input, widget.locale),
            onSaved: (value) => _cardData.cvc = value ?? '',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              child: ElevatedButton(
                style: ButtonStyle(
                  minimumSize:
                      const MaterialStatePropertyAll<Size>(Size.fromHeight(55)),
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(AppColors().green),
                ),
                onPressed: _isSubmitting ? () {} : _saveForm,
                child: _isSubmitting
                    ? CircularProgressIndicator(
                        color: AppColors().green,
                        strokeWidth: 2,
                      )
                    : Text(showAmount(widget.config.amount, widget.locale),
                        style: const TextStyle().style10),
              ),
            ),
          ),
          SaveCardNotice(tokenizeCard: _tokenizeCard, locale: widget.locale)
        ],
      ),
    );
  }
}

void closeKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
