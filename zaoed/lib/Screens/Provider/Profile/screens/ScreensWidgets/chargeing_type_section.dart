import 'package:zaoed/constants/imports.dart';

class ChargingTypeSection extends StatelessWidget {
  const ChargingTypeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'نوع وعدد منافذ الشحن',
          style: TextStyle(color: AppColors().white, fontSize: 20),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              ChargingType(
                imageUrl: 'lib/assets/icons/GB.png',
                count: '2',
                type: 'GB/T AC',
                
              ),
              ChargingType(
                imageUrl: 'lib/assets/icons/Type 2.png',
                count: '2',
                type: 'Type2',
              ),
              ChargingType(
                imageUrl: 'lib/assets/icons/Tesla.png',
                count: '2',
                type: 'Tesla',
              ),
              ChargingType(
                imageUrl: 'lib/assets/icons/Type 1.png',
                count: '2',
                type: 'Type1',
              ),
              ChargingType(
                imageUrl: 'lib/assets/icons/CCS 1.png',
                count: '2',
                type: 'CCS 1',
              ),
              ChargingType(
                imageUrl: 'lib/assets/icons/CCS 2.png',
                count: '2',
                type: 'CCS 2',
              ),
              ChargingType(
                imageUrl: 'lib/assets/icons/Chademo.png',
                count: '2',
                type: 'Chademo',
              )
            ],
          ),
        )
      ],
    );
  }
}
