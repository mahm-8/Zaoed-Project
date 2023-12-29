import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/blocs/providor_bloc/provider_bloc.dart';
import 'package:zaoed/constants/imports.dart';

Future<dynamic> DeleteChargingPoint(BuildContext context, int index) {
  return showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return DialogWidget(
        title: "حذف نقطة الشحن",
        bodyText: "سيتم حذف نقطة الشحن المحددة بشكل نهائي، هل أنت موافق؟",
        button1: 'نعم',
        button2: 'لا',
        pressOne: () {
          final bloc = context.read<ActionsBloc>();
          final pointID = bloc.bookmarkData?[index].pointId;

          context
              .read<ProviderBloc>()
              .add(DeleteChargingPointEvent(pointId: pointID));
          showDialog(
            barrierColor: Colors.transparent,
            context: context,
            builder: (context) {
              return const StateDialog(
                title: "تمت عملية الحذف بنجاح",
              );
            },
          );
          Future.delayed(const Duration(seconds: 3), () {
            context.pop();
            context.pop();
          });
        },
        pressTwo: () {
          context.pop();
        },
      );
    },
  );
}
