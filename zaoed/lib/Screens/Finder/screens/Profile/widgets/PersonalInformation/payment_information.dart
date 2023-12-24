import 'package:zaoed/constants/imports.dart';

class PaymentFinder extends StatelessWidget {
  const PaymentFinder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors().gray6,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        InfoLabelWidget(
          imageIcon: 'lib/assets/icons/akar-icons_credit-card.png',
          title: 'البطاقات',
          onTap: () {
            context.push(view: const CardScreen());
          },
        ),
        Divider(
          thickness: 1,
          color: AppColors().black,
        ),
        InfoLabelWidget(
          imageIcon: 'lib/assets/icons/Bill.png',
          title: 'سجل عمليات الدفع',
          onTap: () {},
        ),
      ]),
    );
  }
}
