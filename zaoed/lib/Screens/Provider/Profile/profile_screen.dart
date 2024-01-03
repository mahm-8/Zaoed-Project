import 'package:zaoed/constants/imports.dart';

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
