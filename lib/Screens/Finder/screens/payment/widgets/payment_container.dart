// ignore_for_file: must_be_immutable

import 'package:zaoed/constants/imports.dart';

class PaymentContainer extends StatelessWidget {
  PaymentContainer({
    super.key,
  });
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.getWidth(),
        decoration: BoxDecoration(
            color: AppColors().gray6, borderRadius: BorderRadius.circular(8)),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            child: BlocBuilder<CardBloc, CardState>(
              builder: (context, state) {
                if (state is GetCardDataState) {
                  return Column(
                    children: [
                      ...state.cards.map((e) => Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                      'lib/assets/icons/logos_mastercard.png'),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                      e?.numberCard
                                              ?.substring(12)
                                              .padRight(12, '*') ??
                                          "0000000000000000"
                                              .substring(12)
                                              .padRight(12, '*'),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors().white)),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {
                                        isClicked = true;
                                      },
                                      child: CircleAvatar(
                                        maxRadius: 10,
                                        minRadius: 10,
                                        backgroundColor: isClicked
                                            ? AppColors().green
                                            : Colors.transparent,
                                        child: isClicked
                                            ? const Icon(
                                                Icons.check,
                                                size: 20,
                                              )
                                            : Container(),
                                      ))
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: AppColors().gray9,
                              )
                            ],
                          ))
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
          InkWell(
            onTap: () {
              context.push(view: PaymentMethods());
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 14),
              child: Row(
                children: [
                  Text(
                    'إضافة طريقة دفع أخرى',
                    style: TextStyle(fontSize: 18, color: AppColors().white),
                  ),
                  const Spacer(),
                  Image.asset('lib/assets/icons/small-left-solid.png')
                ],
              ),
            ),
          ),
        ]));
  }
}
