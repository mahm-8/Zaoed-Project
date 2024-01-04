import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/constants/imports.dart';

// ignore: must_be_immutable
class CaponWidget extends StatelessWidget {
  CaponWidget({
    super.key,
    required this.caponController,
    required this.price,
  });

  final TextEditingController caponController;

  double price;
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ActionsBloc>();
    return SizedBox(
        height: 40,
        width: context.getWidth(),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: TextField(
                cursorColor: AppColors().green,
                controller: caponController,
                decoration: InputDecoration(
                    fillColor: AppColors().gray6,
                    filled: true,
                    focusedBorder: OutlineStyle.transparentBorder,
                    border: OutlineStyle.raduisOutlineBorder),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors().green,
                    borderRadius: BorderRadius.circular(8)),
                child: TextButton(
                  onPressed: () {
                    context
                        .read<ActionsBloc>()
                        .add(CaponEvent(price: bloc.price!, capon: 'Zaoed'));
                  },
                  child: Text(
                    'Capon',
                    style: TextStyle(
                        color: AppColors().gray9, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
