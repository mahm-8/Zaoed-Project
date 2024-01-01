import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaoed/Screens/Provider/Profile/AppBar/information_app_bar.dart';
import 'package:zaoed/Screens/Provider/Profile/widgets/PersonalInformation/about_us_information.dart';
import 'package:zaoed/Screens/Provider/Profile/widgets/PersonalInformation/payment_information.dart';
import 'package:zaoed/Screens/Provider/Profile/widgets/PersonalInformation/provider_information.dart';
import 'package:zaoed/Screens/Provider/Profile/widgets/PersonalInformation/public_sittings.dart';
import 'package:zaoed/Screens/Provider/Profile/widgets/PersonalInformation/social_media_information.dart';
import 'package:zaoed/Screens/Provider/Profile/widgets/information_title.dart';
import 'package:zaoed/blocs/finder/user_bloc/user_bloc.dart';
import 'package:zaoed/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserBloc>();
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: profailAppBar(context, bloc.user?.name ?? ''),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InformationTitle(
                title: 'بياناتي',
              ),
              ProviderInformation(),
              InformationTitle(
                title: 'عام',
              ),
              PublicSittings(),
              InformationTitle(
                title: 'الدفع',
              ),
              PaymentInformation(),
              InformationTitle(
                title: 'عن تطبيق زوّد',
              ),
              AboutUsInformation(),
              SizedBox(
                height: 32,
              ),
              SocialMediaInformation(),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
