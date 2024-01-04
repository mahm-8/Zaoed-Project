import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/extensions/text_style.dart';

class LocationInformation extends StatelessWidget {
  const LocationInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<FinderBloc>().add(InvoiceDataEvent());
    return Container(
      height: 69,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: AppColors().gray6),
      padding: const EdgeInsets.all(8),
      child: BlocBuilder<FinderBloc, FinderState>(
        buildWhen: (_, newState) {
          if (newState is InvoiceDataState) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is InvoiceDataState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('lib/assets/icons/pin_logo.png'),
                    const SizedBox(width: 8),
                    Text(
                      state.invoice?.last["provider_name"] ?? "",
                      style: const TextStyle().style6,
                    ),
                    const SizedBox(width: 8),
                    Image.asset('lib/assets/icons/Star.png'),
                    const SizedBox(width: 4),
                    Text(
                      '5.0',
                      style: const TextStyle().style27,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '(50)',
                      style: const TextStyle().style28,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '${state.invoice?.last["address"].toString().split(",")[0].substring(0, 6)}',
                    style: const TextStyle().style29,
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
