import 'package:flutter/material.dart';
import 'package:zaoed/screens/auth/login_screen.dart';
import 'package:zaoed/screens/auth/signup_screen.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xff21232b),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 55,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Image.asset(
                    "lib/assets/icons/language.png",
                    width: 25,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    "English",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ]),
                Image.asset('lib/assets/images/faded_logo.png'),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: const Color(0xff3FEDB2), width: 2)),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: const TabBar(
                      dividerColor: Colors.transparent,
                      labelColor: Color(0xff21232b),
                      labelPadding: EdgeInsets.all(8),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        color: Color(0xff3FEDB2),
                      ),
                      unselectedLabelColor: Color(0xff3FEDB2),
                      tabs: [
                        Tab(
                          child: Text(
                            "صاحب نقطة شحن",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: "SfArabic"),
                          ),
                        ),
                        Tab(
                          child: Text("صاحب مركبة",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "SfArabic")),
                        ),
                      ]),
                ),
                Expanded(
                  child: TabBarView(children: [
                    // edit here is
                    //providor login page
                    //Finder login page

                    SignUpScreen(),
                    LoginScreen(),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
