import 'package:flutter/material.dart';

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
          const Text(
            "اشحن وادفع بأمان",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 31,
              fontFamily: "SfArabic",
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "يمكنك شحن سيارتك بكل سهولة أينما كُنت، بالإضافة لتوفر الطرق الآمنة للدفع",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white, fontFamily: 'SFArabic', fontSize: 14.5),
          ),
        ],
      ),
    );
  }
}
