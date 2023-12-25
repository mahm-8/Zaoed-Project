import 'package:zaoed/constants/imports.dart';

class TabBarLogin extends StatefulWidget {
  const TabBarLogin({
    super.key,
  });

  @override
  State<TabBarLogin> createState() => _TabBarLoginState();
}

class _TabBarLoginState extends State<TabBarLogin>
    with SingleTickerProviderStateMixin {
  late TabController logintabController = TabController(length: 2, vsync: this);
  int selectedTabIndex = 0; //providor = 0, finder = 1

  // @override
  // void initState() {
  //   super.initState();
  //   logintabController = TabController(length: 2, vsync: this);
  //   logintabController.addListener(() {
  //     // add bloc + remove stateful
  //     setState(() {
  //       selectedTabIndex = logintabController.index;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors().gray9,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  controller: logintabController,
                ),
                Expanded(
                  child: TabBarView(controller: logintabController, children: [
                    LoginScreen(),
                    LoginScreen(),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
