import 'package:zaoed/constants/imports.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

ratingBottomSheet(BuildContext context,
    {TextEditingController? controller, double rate = 1.0}) {
  showBottomSheet(
    backgroundColor: AppColors().gray6,
    context: context,
    builder: (BuildContext context) {
      final user = context.read<UserBloc>();
      return Container(
        constraints: BoxConstraints(
            minHeight: context.getHeight(divide: 10),
            maxHeight: context.getHeight(divide: 1.8)),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors().gray),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'شكراً ${user.user?.name ?? ""} لاستخدامك نقطة الشحن',
              style: const TextStyle().style5,
            ),
            const SizedBox(height: 8),
            Text(
              '''قيم تجربتك لمساعدتنا في تطوير وتحسين خدماتنا 
                        وتقديم تجربة مميزة لكم 🤩.''',
              style: const TextStyle().style6,
            ),
            const SizedBox(height: 8),
            BlocBuilder<RaitingBloc, RaitingState>(
              builder: (context, state) {
                if (state is UpdateRateState) {
                  return RatingBar.builder(
                    initialRating: state.rate,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => ImageIcon(
                      const AssetImage('lib/assets/icons/Star 5.png'),
                      color: AppColors().green,
                    ),
                    onRatingUpdate: (rating) {
                      rate = rating;
                      context
                          .read<RaitingBloc>()
                          .add(UpdateRateEvent(rate: rating));
                    },
                  );
                }
                return RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => ImageIcon(
                    const AssetImage('lib/assets/icons/Star 5.png'),
                    color: AppColors().green,
                  ),
                  onRatingUpdate: (rating) {
                    rate = rating;
                    context
                        .read<RaitingBloc>()
                        .add(UpdateRateEvent(rate: rating));
                  },
                );
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: 'قيم تجربتك هنا...',
                  hintStyle: const TextStyle().style7,
                  border: OutlineStyle.defaultRatingBorder),
            ),
            const SizedBox(height: 20),
            ButtonWidget(
                textEntry: 'إرسال',
                backColor: AppColors().green,
                onPress: () {
                  context.read<RaitingBloc>().add(SaveRateEvent(
                      rate: rate, comment: controller?.text ?? ""));

                  controller?.clear();
                  context.read<BottomSheetStatusBloc>().add(UpdateStatusEvent(
                        status: Status.nono,
                      ));
                  context.pop();
                },
                textColor: AppColors().black)
          ],
        ),
      );
    },
  );
}
