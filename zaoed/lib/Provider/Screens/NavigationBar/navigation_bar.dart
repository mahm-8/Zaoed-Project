import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass/glass.dart';
import 'package:zaoed/Provider/Screens/Profile/profile_screen.dart';
import 'package:zaoed/blocs/page_bloc/pages_bloc.dart';
import 'package:zaoed/constants/colors.dart';
import 'package:zaoed/finder/screens/Profile/profile_screen.dart';

class NavigationBarScreen extends StatelessWidget {
   NavigationBarScreen({super.key});

  final List screens = [
    const ProfileFinder(),
    ProfileScreen(),
    const ProfileFinder(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagesBloc, PagesState>(
      builder: (context, state) {
        if (state is PagesNavigationState) {
          return Scaffold(
            extendBody: true,
            body: screens[state.seleted],
            bottomNavigationBar: SizedBox(
              height: 64,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors().green,
                unselectedItemColor: AppColors().white,
                backgroundColor: Colors.transparent,
                currentIndex: state.seleted,
                onTap: (index) {
                  context.read<PagesBloc>().add(PageNavigationEvent(index));
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(
                      'lib/assets/icons/bookmarked.png',
                    )),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(
                      'lib/assets/icons/car.png',
                    )),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage(
                      'lib/assets/icons/map.png',
                    )),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage(
                        'lib/assets/icons/person.png',
                      ),
                      size: 29,
                    ),
                    label: '',
                  ),
                ],
              ).asGlass(
                tintColor: Colors.transparent,
              ),
            ),
          );
        }
        return Scaffold(
          extendBody: true,
          body: screens[2],
          bottomNavigationBar: SizedBox(
            height: 64,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors().green,
              unselectedItemColor: AppColors().white,
              backgroundColor: Colors.transparent,
              currentIndex: 2,
              onTap: (index) {
                context.read<PagesBloc>().add(PageNavigationEvent(index));
              },
              items: const [
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                    'lib/assets/icons/bookmarked.png',
                  )),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                    'lib/assets/icons/car.png',
                  )),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(
                    'lib/assets/icons/map.png',
                  )),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      'lib/assets/icons/person.png',
                    ),
                    size: 29,
                  ),
                  label: '',
                ),
              ],
            ).asGlass(
              tintColor: Colors.transparent,
            ),
          ),
        );
      },
    );
  }
}
