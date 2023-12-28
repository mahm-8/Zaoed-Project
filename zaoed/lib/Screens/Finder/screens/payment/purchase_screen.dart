import 'package:zaoed/blocs/card_bloc/card_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({
    super.key,
    required this.onTap,
  });
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: context.getWidth(),
      height: context.getHeight() / 1.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleLabel(
            title: 'الدفع',
          ),
          
             
              PaymentContainer( 
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ButtonWidget(
                textEntry: 'الحجز',
                backColor: AppColors().green,
                onPress: onTap,
                textColor: AppColors().white),
          ),
        ],
      ),
    );
  }
}
