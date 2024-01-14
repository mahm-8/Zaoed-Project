// ignore_for_file: must_be_immutable

import 'package:zaoed/constants/imports.dart';

class OnboradingScreen extends StatelessWidget {
  OnboradingScreen({super.key});

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagesBloc, PagesState>(
      builder: (context, state) {
        if (state is PageOnboardingState) {
          return Scaffold(
              backgroundColor: AppColors().gray9,
              body: Stack(children: [
                const MapBackground(),
                Positioned(
                  child: SizedBox(
                    child: PageView(
                      controller: controller,
                      onPageChanged: (value) {
                        context
                            .read<PagesBloc>()
                            .add(PageOnboardingEvent(value));
                      },
                      children: const [
                        Page1(),
                        Page2(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 850,
                  left: 165,
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 2,
                    effect: ExpandingDotsEffect(
                        activeDotColor: AppColors().green,
                        dotHeight: 3,
                        strokeWidth: 0.5,
                        dotColor: AppColors().gray4),
                  ),
                )
              ]),
              bottomNavigationBar: state.selected == 0
                  ? OnboardingRow(
                      pageController: controller,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      child: ButtonWidget(
                        backColor: AppColors().green,
                        textEntry: 'ابدأ',
                        onPress: () {
                          context.pushAndRemoveUntil(view: const TabBarLogin());
                        },
                        textColor: AppColors().gray8,
                      ),
                    ));
        }
        return Scaffold(
            backgroundColor: AppColors().gray9,
            body: Stack(children: [
              const MapBackground(),
              Positioned(
                child: SizedBox(
                  child: PageView(
                    controller: controller,
                    onPageChanged: (value) {
                      context.read<PagesBloc>().add(PageOnboardingEvent(value));
                    },
                    children: const [
                      Page1(),
                      Page2(),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 650,
                left: 165,
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 2,
                  effect: ExpandingDotsEffect(
                      activeDotColor: AppColors().green,
                      dotHeight: 3,
                      strokeWidth: 0.5,
                      dotColor: AppColors().gray4),
                ),
              )
            ]),
            bottomNavigationBar: OnboardingRow(
              pageController: controller,
            ));
      },
    );
  }
}
