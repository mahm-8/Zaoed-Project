
import 'package:zaoed/constants/imports.dart';

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
    // final card = context.read<CardBloc>();
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
                    context.read<FinderBloc>().add(AddCarsChargeEvent(
                        chargingPoint: widget.chargingPoint,
                        hour: widget.hour));
                    context.read<FinderBloc>().add(PayEvent(
                        nameFinder: user.user?.name ?? "",
                        type: widget.type,
                        amount: bloc.price ?? 0.0,
                        providerName: widget.chargingPoint.pointName ?? "",
                        address:
                            "${widget.chargingPoint.latitude},${widget.chargingPoint.longitude}"));
                    context.read<FinderBloc>().add(InvoiceDataEvent());
                    context.read<GoogleMapBloc>().add(FetchPolylineEvent(
                        distention: LatLng(widget.chargingPoint.latitude ?? 0.0,
                            widget.chargingPoint.longitude ?? 0.0)));
             
                    setState(() {
                      activeStep = 2;
                    });
             
                  },
                ),
              ],
              if (activeStep == 2) ...[
                BillScreen(
                  onTap: () {
                 if (user.user?.type == 'provider') {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavigationBarScreen()),
                        (route) => false,
                      );
                    } else if (user.user!.type == 'finder') {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FinderNavigationBarScreen()),
                        (route) => false,
                      );
                    }
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
