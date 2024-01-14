import 'package:zaoed/constants/imports.dart';

class OnboardingRow extends StatelessWidget {
  const OnboardingRow({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {
                context.pushAndRemoveUntil(view: const TabBarLogin());
              },
              child: Text("تخطي", style: const TextStyle().style22)),
          TextButton(
              onPressed: () {
                pageController.nextPage(
                    duration: const Duration(seconds: 1), curve: Curves.ease);
              },
              child: Text(
                "التالي",
                style: const TextStyle().style35,
              )),
        ],
      ),
    );
  }
}
