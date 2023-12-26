import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaoed/Screens/Finder/screens/Profile/screens/ScreensWidgets/edit_profile_screen.dart';
import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/blocs/finder/user_bloc/user_bloc.dart';

class InformationScreen extends StatelessWidget {
  InformationScreen({super.key});
  final dateController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controllerText(context);
    final bloc = context.read<UserBloc>();
    return bloc.user?.gender == null
        ? AddInformation(
            dateController: dateController,
            nameController: nameController,
            phoneController: phoneController,selectGender: bloc.user?.gender??"Select gender")
        : EditProfileScreen(user: bloc.user);
//first screen
  }

  controllerText(BuildContext context) {
    final user = context.read<UserBloc>();
    dateController.text = user.user?.birthday ?? "";
    nameController.text = user.user?.name ?? "";
    phoneController.text = user.user?.phone ?? "";
  }
}
