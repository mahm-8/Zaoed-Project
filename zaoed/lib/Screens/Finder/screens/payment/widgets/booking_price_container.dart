import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class BookingPriceContainer extends StatelessWidget {
  BookingPriceContainer({
    super.key,
    required this.discount,
    this.hour,
  });

  final int discount;

  String? capon;

  String? hour;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ActionsBloc>();
    return Container(
      height: 192,
      width: 350,
      decoration: BoxDecoration(
          color: AppColors().gray6, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          BookingPriceLabel(
            title: 'السعر الفرعي',
            subTitle: '${bloc.price} ريال',
          ),
          BookingPriceLabel(
            title: 'عدد ساعات الشحن',
            subTitle: '${hour}',
          ),
          BookingPriceLabel(
            title: 'الخصم ($discount)',
            subTitle: 'غير متوفر حاليا',
            isDiscount: true,
          ),
          Divider(
            thickness: 1,
            color: AppColors().gray9,
          ),
          BookingPriceLabel(
            title: 'المجموع (تتضمن الـ VAT)',
            subTitle: '${bloc.price} ريال',
          )
        ],
      ),
    );
  }
}
