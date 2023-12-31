// ignore_for_file: must_be_immutable

import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class BookingLocationInformation extends StatelessWidget {
  const BookingLocationInformation({
    super.key,
    this.bookmarks,
  });
  final ChargingPoint? bookmarks;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActionsBloc, ActionsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "الموقع",
              style: TextStyle(fontSize: 19, color: AppColors().white),
            ),
            Text(
              '${bookmarks?.pointName}',
              style: TextStyle(fontSize: 17, color: AppColors().white),
            ),
            Text(
              "${bookmarks?.longitude}, ${bookmarks?.latitude}",
              style: TextStyle(
                  color: AppColors().white,
                  fontSize: 12,
                  fontWeight: FontWeight.w200),
            ),
          ],
        );
      },
    );
  }
}
