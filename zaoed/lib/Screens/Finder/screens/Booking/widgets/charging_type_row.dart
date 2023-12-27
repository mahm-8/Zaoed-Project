// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaoed/Screens/Finder/screens/Booking/widgets/charging_type_container.dart';
import 'package:zaoed/blocs/auth_bloc/page_bloc/pages_bloc.dart';

class ChargingTypeRow extends StatelessWidget {
  ChargingTypeRow({super.key, required this.types, required this.imageUrl});
  int selectedIndex = -1;
  final List<String> imageUrl;
  final List<String> types;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 80,
        child: BlocBuilder<PagesBloc, PagesState>(
          buildWhen: (previous, current) {
            if (current is ChargingTypeState) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            if (state is ChargingTypeState) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageUrl.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.read<PagesBloc>().add(ChargingTypeEvent(index));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: ChargingTypeContainer(
                      imageUrl: imageUrl[index],
                      type: types[index],
                      isSelected: state.selected == index,
                    ),
                  ),
                ),
              );
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageUrl.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  context.read<PagesBloc>().add(ChargingTypeEvent(index));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ChargingTypeContainer(
                    imageUrl: imageUrl[index],
                    type: types[index],
                    isSelected: selectedIndex == index,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
