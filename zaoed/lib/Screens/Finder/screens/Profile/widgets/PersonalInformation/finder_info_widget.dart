import 'package:zaoed/Screens/Finder/screens/Profile/screens/ScreensWidgets/edit_profile_screen.dart';
import 'package:zaoed/blocs/finder/user_bloc/user_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class FinderInfoWidget extends StatelessWidget {
  const FinderInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserBloc>();
    return Container(
      height: 96,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors().gray6,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InfoLabelWidget(
              imageIcon: 'lib/assets/icons/person1.png',
              title: 'البيانات الشخصية',
              onTap: () {
                context.push(view: EditProfileScreen(user: bloc.user));
              },
            ),
            Divider(color: AppColors().black),
            InfoLabelWidget(
              imageIcon: 'lib/assets/icons/bolt.car.png',
              title: ' بيانات السيارة',
              onTap: () {
                context.push(view: const CarScreen());
              },
            ),
          ]),
    );
  }
}
