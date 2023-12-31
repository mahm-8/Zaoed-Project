// ignore_for_file: must_be_immutable

import 'package:zaoed/Screens/Finder/screens/Booking/booking_confirmation_screen.dart';
import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/blocs/auth_bloc/page_bloc/pages_bloc.dart';
import 'package:zaoed/blocs/bottom_sheet_status_bloc/bottom_sheet_status_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key, required this.bookMark});
  final ChargingPoint bookMark;
  final List hours = [
    'ساعة',
    "ساعتان",
    "3 ساعات",
    "4 ساعات",
    "5 ساعات",
    "6 ساعات",
    "8 ساعات"
  ];
  List<String> types = [
    'GB/T AC',
    'Type2',
    'Tesla',
    'Type1',
  ];
  List<String> imageUrl = [
    'lib/assets/icons/GB.png',
    'lib/assets/icons/Type 2.png',
    'lib/assets/icons/Tesla.png',
    'lib/assets/icons/Type 1.png',
  ];
  @override
  Widget build(BuildContext context) {
    final indexer = context.read<PagesBloc>();
    final bloc = context.read<ActionsBloc>();
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: profileScreenAppBar(context, title: 'الحجز'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleLabel(
              title: 'المنفذ',
            ),
            ChargingTypeRow(types: types, imageUrl: imageUrl),
            const TitleLabel(
              title: 'مدة الشحن',
            ),
            ChargingTime(hours: hours),
            const SizedBox(
              height: 16,
            ),
            Text(
              '*تنبيه، سيتم حجز الموصل لمدة 10 دقائق وفي حال لم يتم إتمام عملية الحجز خلال هذه المدة سيتم إلغاء الحجز',
              style: TextStyle(fontSize: 12, color: AppColors().white),
            ),
            const Spacer(),
            ButtonWidget(
                textEntry: 'التالي',
                backColor: AppColors().green,
                onPress: () {
                  context
                      .read<BottomSheetStatusBloc>()
                      .add(UpdateStatusEvent(status: Status.completedPayment));
                  switch (hours[indexer.hourCharg]) {
                    case 'ساعة':
                      bloc.price = 1 * 50;
                      break;
                    case "ساعتان":
                      bloc.price = 2 * 50;
                      break;
                    case "3 ساعات":
                      bloc.price = 3 * 50;
                      break;
                    case "4 ساعات":
                      bloc.price = 4 * 50;
                      break;
                    case "5 ساعات":
                      bloc.price = 5 * 50;
                      break;
                    case "6 ساعات":
                      bloc.price = 6 * 50;
                      break;
                    case "8 ساعات":
                      bloc.price = 8 * 50;
                      break;
                    default:
                  }

                  context.push(
                      view: BookingConfirmationScreen(
                    type: types[indexer.typePort],
                    hour: hours[indexer.hourCharg],
                    image: imageUrl[indexer.typePort],
                    price: bloc.price!,
                    chargingPoint: bookMark,
                  ));
                },
                textColor: AppColors().gray8)
          ],
        ),
      ),
    );
  }
}
