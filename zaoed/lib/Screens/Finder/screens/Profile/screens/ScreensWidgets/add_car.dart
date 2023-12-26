import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaoed/Screens/Finder/screens/Profile/screens/AppBar/profail_screens_app_bar.dart';
import 'package:zaoed/Screens/Finder/screens/Profile/screens/car_screen.dart';
import 'package:zaoed/Screens/Finder/screens/Profile/widgets/cars_widget/drop_menu.dart';
import 'package:zaoed/Screens/Finder/screens/Profile/widgets/information_title.dart';
import 'package:zaoed/blocs/finder/car_bloc/cars_bloc.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/extensions/navigator.dart';
import 'package:zaoed/extensions/screen_dimensions.dart';

// ignore: must_be_immutable
class AddCar extends StatelessWidget {
  AddCar({super.key});

  final List<String> listBrand = <String>[
    'تيسلا',
    'شيفروليه بولت',
    'نيسان ليف',
    'بي ام دبليو أي3'
  ];

  String brand = "brand";

  String model = "model";

  String type = "type";

  ExpansionTileController brandController = ExpansionTileController();

  ExpansionTileController branController = ExpansionTileController();

  ExpansionTileController braController = ExpansionTileController();

  final List<String> listModel = <String>['موديل 3', 'موديل اس', 'موديل اكس'];

  final List<String> listType = <String>['Chademo', 'CCS 1', 'CCS 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          context
              .read<CarsBloc>()
              .add(AddcarEvent(brand: brand, model: model, type: type));
          context.push(view: const CarScreen());
        },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            foregroundColor: AppColors().gray8,
            minimumSize: Size(context.getWidth(divide: 1.1), 40),
            backgroundColor: AppColors().green),
        child: const Text("حفظ"),
      ),
      backgroundColor: AppColors().gray9,
      appBar: appBar(context, title: 'إضافة مركبة'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const TitleInfoWidget(title: 'ماركة السيارة'),
            BlocBuilder<CarsBloc, CarsState>(
              buildWhen: (previous, current) {
                if (current is CarBrandState) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                if (state is CarBrandState) {
                  return DropDownWidget(
                      brandController: brandController,
                      brand: state.brand,
                      list: listBrand);
                }
                return DropDownWidget(
                    brandController: brandController,
                    brand: brand,
                    list: listBrand);
              },
            ),
            const TitleInfoWidget(title: 'موديل السيارة'),
            BlocBuilder<CarsBloc, CarsState>(
              buildWhen: (previous, current) {
                if (current is CarModelState) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                if (state is CarModelState) {
                  return DropDownWidget(
                      brandController: braController,
                      brand: state.mdel,
                      list: listModel);
                }
                return DropDownWidget(
                    brandController: braController,
                    brand: model,
                    list: listModel);
              },
            ),
            const TitleInfoWidget(title: 'منفذ الشاحن'),
            BlocBuilder<CarsBloc, CarsState>(
              buildWhen: (previous, current) {
                if (current is CarTypeState) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                if (state is CarTypeState) {
                  return DropDownWidget(
                      brandController: branController,
                      brand: state.type,
                      list: listType);
                }
                return DropDownWidget(
                    brandController: branController,
                    brand: type,
                    list: listType);
              },
            ),
            const SizedBox(height: 10),
            const TitleInfoWidget(title: 'الموقع'),
            Container(
              width: context.getWidth(divide: 1.2),
              height: context.getHeight(divide: 3),
              decoration: BoxDecoration(
                  color: AppColors().gray6,
                  borderRadius: BorderRadius.circular(15)),
            )
          ],
        ),
      ),
    );
  }
}
