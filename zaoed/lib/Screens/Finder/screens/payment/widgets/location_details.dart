
import 'package:zaoed/constants/imports.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 118,
      child: Row(
        children: [
          Image.asset('lib/assets/icons/Location.png'),
          const SizedBox(
            width: 8,
          ),
          Column(
            children: [
              Container(
                height: 48,
                width: 326,
                decoration: BoxDecoration(
                    color: AppColors().gray6,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 10),
                  child: Text(
                    'أكاديمية طويق',
                    style: TextStyle(
                        color: AppColors().white, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Container(
                height: 48,
                width: 326,
                decoration: BoxDecoration(
                    color: AppColors().gray6,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 10),
                  child: Text(
                    'حي النرجس',
                    style: TextStyle(
                        color: AppColors().white, fontSize: 18),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}