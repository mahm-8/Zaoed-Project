
import 'package:zaoed/constants/imports.dart';

class TabbarSignup extends StatefulWidget {
  const TabbarSignup({super.key});

  @override
  State<TabbarSignup> createState() => _TabbarSignupState();
}

class _TabbarSignupState extends State<TabbarSignup>
    with SingleTickerProviderStateMixin {
  late TabController signuptabController =
      TabController(length: 2, vsync: this);
  int selectedTabIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   signuptabController = TabController(length: 2, vsync: this);
  //   signuptabController.addListener(() {
  //     setState(() {
  //       selectedTabIndex = signuptabController.index;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: selectedTabIndex,
      length: 2,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors().gray9,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 55,
                ),
                const LanguageWidget(),
                Image.asset('lib/assets/images/faded_logo.png'),
                const SizedBox(
                  height: 50,
                ),
                TabBarWidget(
                  controller: signuptabController,
                ),
                Expanded(
                  child: TabBarView(controller: signuptabController, children: [
                    SignUpScreen(),
                    SignUpScreen(),
                  ]),
                ),
              ],
            ),
          )),
    );
  }
}
