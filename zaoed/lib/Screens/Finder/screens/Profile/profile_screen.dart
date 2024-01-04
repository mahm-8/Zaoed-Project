import 'package:zaoed/constants/imports.dart';

class ProfileFinder extends StatelessWidget {
  const ProfileFinder({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UserBloc>();
    return Scaffold(
      backgroundColor: AppColors().gray9,
      appBar: profailAppBar(
        context,bloc.user?.name??''
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: const [
              TitleInfoWidget(
                title: 'بياناتي',
              ),
              FinderInfoWidget(),
              TitleInfoWidget(
                title: 'عام',
              ),
              SettingWidget(),
              TitleInfoWidget(
                title: 'الدفع',
              ),
              PaymentFinder(),
              TitleInfoWidget(
                title: 'عن تطبيق زوّد',
              ),
              AboutUsInformation(),
              SizedBox(
                height: 32,
              ),
              SocialMediaInformation()
            ],
          ),
        ),
      ),
    );
  }
}
