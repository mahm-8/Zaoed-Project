import 'package:zaoed/constants/imports.dart';

class AddInformation extends StatelessWidget {
  AddInformation(
      {super.key,
      this.selectGender = "إختيار الجنس",
      required this.dateController,
      required this.nameController,
      required this.phoneController});

  final List<String> gender = ["ذكر", "أنثى"];
  final String? selectGender;
  final ExpansionTileController genderController = ExpansionTileController();
  final TextEditingController dateController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocListener<UserBloc, UserState>(
          listenWhen: (previous, current) {
            if (current is SuccessUpdateState) {
              return true;
            }
            return false;
          },
          listener: (context, state) {
            if (state is SuccessUpdateState) {
              context.successAddInfo(msg: 'تم إضافة البيانات بنجاح');
              final user = context.read<UserBloc>();

              Future.delayed(const Duration(seconds: 2), () {
                context.push(view: EditProfileScreen(user: user.user));
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ButtonWidget(
              textEntry: "حفظ",
              onPress: () {
                final user = UserModel(
                    name: nameController.text,
                    phone: phoneController.text,
                    birthday: dateController.text,
                    gender: selectGender);
                context.read<UserBloc>().add(UpdateUserEvent(user));
                context.showLoading();
              },
              backColor: AppColors().green,
              textColor: AppColors().gray8,
            ),
          )),
      backgroundColor: AppColors().gray9,
      appBar: appBar(context, title: 'البيانات الشخصية'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(children: [
          FieldTextWidget(
            title: 'الاسم كامل',
            hint: "ادخل الاسم",
            controller: nameController,
          ),
          FieldTextWidget(
            title: 'تاريخ الميلاد',
            hint: "ادخل تاريخ الميلاد",
            keyboardType: TextInputType.datetime,
            controller: dateController,
            isFelid: false,
            onTap: () => showDatePickerWidget(
              context: context,
              onDateTimeChanged: (date) {
                dateController.text = date;
              },
            ),
          ),
          Text(
            "الجنس",
            style: const TextStyle().style4,
          ),
          BlocBuilder<UserBloc, UserState>(
            buildWhen: (previous, current) {
              if (current is GenderState) {
                return true;
              }
              return false;
            },
            builder: (context, state) {
              if (state is GenderState) {
                return DropDownWidget(
                    brand: state.gender,
                    list: gender,
                    brandController: genderController);
              }
              return DropDownWidget(
                  brand: selectGender!,
                  list: gender,
                  brandController: genderController);
            },
          ),
          FieldTextWidget(
            title: 'رقم الجوال',
            hint: "ادخل رقم الجوال",
            controller: phoneController,
          ),
        ]),
      ),
    );
  }
}
