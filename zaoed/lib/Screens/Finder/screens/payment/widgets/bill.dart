import 'package:zaoed/constants/imports.dart';

import '../../../../../blocs/finder_bloc/finder_bloc.dart';

class Bill extends StatelessWidget {
  const Bill({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 516,
        width: 270,
        color: AppColors().white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<FinderBloc, FinderState>(
            builder: (context, state) {
              if (state is InvoiceDataState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('lib/assets/icons/Group 31778.png'),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: BillTimeDetails(),
                    ),
                    BillToken(token: state.invoice?.last["token"] ?? ""),
                    const BillLabel(
                      title: 'Token Type',
                      subTitle: 'Visa Credit',
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const BillLabel(
                      title: 'Customer Name',
                      subTitle: 'Salwa Ibrahim',
                    ),
                    BillLabel(
                      title: 'Charger Type',
                      subTitle: state.invoice?.last["type"] ?? "",
                    ),
                    BillLabel(
                      title: 'Address',
                      subTitle: state.invoice?.last["address"],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    BillLabel(
                      title: 'Amount',
                      subTitle: '${state.invoice?.last["amount"] ?? "0"} SAR',
                    ),
                    BillLabel(
                      title: 'Tax',
                      subTitle: '${state.invoice?.last["tax"] ?? "0.00"}',
                    ),
                    BillLabel(
                      title: 'Total',
                      subTitle:
                          '${((state.invoice?.last["amount"] * (state.invoice?.last["tax"] + 1)).toStringAsFixed(2) ?? "")} SAR',
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    BillLabel(
                      title: 'Provider',
                      subTitle: state.invoice?.last["provider_name"] ?? "",
                    )
                  ],
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('lib/assets/icons/Group 31778.png'),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: BillTimeDetails(),
                  ),
                  const BillToken(),
                  const BillLabel(
                    title: 'Token Type',
                    subTitle: 'Visa Credit',
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const BillLabel(
                    title: 'Customer Name',
                    subTitle: 'Salwa Ibrahim',
                  ),
                  const BillLabel(
                    title: 'Charger Type',
                    subTitle: 'Tesla',
                  ),
                  const BillLabel(
                    title: 'Address',
                    subTitle: '13453 Riyadh St.Narjis',
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const BillLabel(
                    title: 'Amount',
                    subTitle: '57.00 SAR',
                  ),
                  const BillLabel(
                    title: 'Tax',
                    subTitle: '00.00 SAR',
                  ),
                  const BillLabel(
                    title: 'Total',
                    subTitle: '57.00 SAR',
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const BillLabel(
                    title: 'Provider',
                    subTitle: 'Ali Mohammed',
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
