import 'package:zaoed/constants/imports.dart';


class Bill extends StatelessWidget {
  const Bill({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 516,
        width: 270,
        color: AppColors().white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<FinderBloc, FinderState>(
            buildWhen: (previous, current) {
              if (current is InvoiceDataState) {
                return true;
              }
              return false;
            },
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
                      title: 'نوع البطاقة',
                      subTitle: 'Visa',
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    BillLabel(
                      title: 'اسم العميل',
                      subTitle: bloc.user?.name ?? "",
                    ),
                    BillLabel(
                      title: 'منفذ الشحن',
                      subTitle: state.invoice?.last["type"] ?? "",
                    ),
                    BillLabel(
                      title: 'العنوان',
                      subTitle: state.invoice?.last["address"]
                              .toString()
                              .split(",")[0] ??
                          "",
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    BillLabel(
                      title: 'السعر',
                      subTitle: '${state.invoice?.last["amount"] ?? "0"} SAR',
                    ),
                    BillLabel(
                      title: 'الضريبة',
                      subTitle: '${state.invoice?.last["tax"] ?? "0.00"}',
                    ),
                    BillLabel(
                      title: 'المجموع',
                      subTitle:
                          '${((state.invoice?.last["amount"] * (state.invoice?.last["tax"] + 1)).toStringAsFixed(2) ?? "")} SAR',
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    BillLabel(
                      title: 'نقطة الشحن',
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
