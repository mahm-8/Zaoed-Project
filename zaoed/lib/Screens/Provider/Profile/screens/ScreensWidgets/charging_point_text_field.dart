import 'package:zaoed/blocs/providor_bloc/provider_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class AddChargingPointTextField extends StatelessWidget {
  const AddChargingPointTextField({
    super.key,
    required this.textController,
    required this.isEdit,
  });

  final TextEditingController textController;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProviderBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'اسم نقطة الشحن',
          style: TextStyle(color: AppColors().white, fontSize: 20),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 48,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border(
                  top: BorderSide(color: AppColors().green, width: 0.3),
                  left: BorderSide(color: AppColors().green, width: 0.3)),
            ),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                fillColor: AppColors().gray6,
                filled: true,
                // if editing return old data else show hint
                hintText: isEdit ? bloc.pointName : 'المنزل,العمل...',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
