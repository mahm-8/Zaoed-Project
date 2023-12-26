import 'package:zaoed/blocs/auth_bloc/page_bloc/pages_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagesBloc, PagesState>(
      builder: (context, state) {
        if (state is PageTapBarState) {
          print(state.selected);
          return DefaultTabController(
              initialIndex: state.selected,
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
                        child: TabBarView(
                            controller: logintabController,
                            children: [
                              LoginScreen(
                                type: 'provider',
                              ),
                              LoginScreen(
                                type: 'finder',
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ));
        }
        return DefaultTabController(
            initialIndex: 0,
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
                      child:
                          TabBarView(controller: logintabController, children: [
                        LoginScreen(
                          type: 'provider',
                        ),
                        LoginScreen(
                          type: 'finder',
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
