// ignore_for_file: must_be_immutable
import 'package:zaoed/constants/imports.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key, required this.email});
  final String email;
  String pinCode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().gray9,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 120,
              ),
              Text(
                "التحقق من البريد الإلكتروني",
                style: TextStyle(
                  fontSize: 25,
                  color: AppColors().white,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "ادخل رمز التحقق المرسل للبريد الإلكتروني:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: AppColors().white,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                email,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: AppColors().white,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Pinput(
                autofocus: true,
                length: 6,
                showCursor: true,
                pinContentAlignment: Alignment.center,
                defaultPinTheme: PinTheme(
                  textStyle:
                      TextStyle(fontSize: 24, color: AppColors().mainWhite),
                  width: 48,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: AppColors().green, width: 0.4),
                      top: BorderSide(color: AppColors().green, width: 0.4),
                    ),
                    color: AppColors().gray1Trans,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                onCompleted: (pin) {
                  pinCode = pin;
                },
              ),
              const Spacer(),
              BlocListener<AuthBloc, AuthStates>(
                listener: (context, state) {
                  if (state is SuccessVerificationState) {
                    context.push(view: NavigationBarScreen());
                  }
                  if (state is ErrorVerificationState) {
                    context.showErrorMessage(msg: state.message);
                  }
                },
                child: ButtonWidget(
                  textEntry: "التالي",
                  backColor: AppColors().gray4,
                  textColor: AppColors().gray8,
                  onPress: () {
                    context
                        .read<AuthBloc>()
                        .add(VerificationEvent(otp: pinCode, email: email));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
