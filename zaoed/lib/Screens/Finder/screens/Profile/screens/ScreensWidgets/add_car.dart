import 'package:zaoed/constants/imports.dart';

class AddCar extends StatefulWidget {
  const AddCar({super.key});

  @override
  State<AddCar> createState() => _AddCarState();
}

class _AddCarState extends State<AddCar> {
  final List<String> listBrand = <String>[
    'تيسلا',
    'شيفروليه بولت',
    'نيسان ليف',
    'بي ام دبليو أي3'
  ];

  String brand = "brand";
  String model = "brand";
  String type = "brand";
  ExpansionTileController brandController = ExpansionTileController();
  final List<String> listModel = <String>['موديل 3', 'موديل اس', 'موديل اكس'];

  final List<String> listType = <String>['Chademo', 'CCS 1', 'CCS 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
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
            DropDownWidget(
                brandController: brandController,
                brand: brand,
                list: listBrand),
            const TitleInfoWidget(title: 'موديل السيارة'),
            DropDownWidget(
                brandController: ExpansionTileController(),
                brand: model,
                list: listModel),
            const TitleInfoWidget(title: 'منفذ الشاحن'),
            DropDownWidget(
                brandController: ExpansionTileController(),
                brand: type,
                list: listType),
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
