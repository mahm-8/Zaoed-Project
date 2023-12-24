import 'package:zaoed/constants/imports.dart';

class Page2 extends StatelessWidget {
  const Page2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
          ),
          Text(
            "اشحن وادفع بأمان",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors().mainWhite,
              fontSize: 31,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "يمكنك شحن سيارتك بكل سهولة أينما كُنت، بالإضافة لتوفر الطرق الآمنة للدفع",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors().mainWhite, fontSize: 14.5),
          ),
        ],
      ),
    );
  }
}
