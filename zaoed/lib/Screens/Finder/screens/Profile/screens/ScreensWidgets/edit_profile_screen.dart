import 'package:zaoed/constants/imports.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: ElevatedButton(
            onPressed: () {
              context.push(view: const TabBarLogin());
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                foregroundColor: AppColors().gray8,
                minimumSize: Size(context.getWidth(divide: 1.1), 40),
                backgroundColor: AppColors().green),
            child: const Text(
              "تسجيل الخروج",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        appBar: appBar(context, title: 'البيانات الشخصية'),
        backgroundColor: AppColors().gray9,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(children: [
              Column(
                children: [
                  SizedBox(
                    height: context.getHeight(divide: 8),
                    width: context.getWidth(divide: 4),
                    child: Stack(children: [
                      Container(
                        height: context.getHeight(divide: 8),
                        width: context.getWidth(divide: 4),
                        decoration: BoxDecoration(
                            color: AppColors().gray6,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100))),
                        child: Icon(
                          Icons.person_outline,
                          size: 35,
                          color: AppColors().white,
                        ),
                      ),
                      Positioned(
                        top: 70,
                        left: 0.1,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: AppColors().black,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(100))),
                          child: Icon(
                            Icons.add,
                            color: AppColors().white,
                          ),
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors().gray6),
                    child: Column(
                      children: [
                        const EditProfile(
                          title: 'الاسم :',
                          value: 'محمد',
                        ),
                        Divider(color: AppColors().black),
                        const EditProfile(
                          title: 'تاريخ الميلاد',
                          value: '2023/12/12',
                        ),
                        Divider(color: AppColors().black),
                        const EditProfile(
                          title: 'الجنس',
                          value: 'ذكر',
                        ),
                        Divider(color: AppColors().black),
                        const EditProfile(
                          title: 'رقم الجوال',
                          value: '0512345678',
                        ),
                        Divider(color: AppColors().black),
                        const EditProfile(
                          title: 'البريد',
                          value: 'aa@gmail.com',
                        ),
                        Divider(color: AppColors().black),
                        const EditProfile(
                          title: 'كلمة المرور',
                          value: '********',
                        ),
                        Divider(color: AppColors().black),
                        const EditProfile(
                          title: 'حذف الحساب',
                          icon: Icons.keyboard_arrow_left,
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )
                ],
              )
            ]),
          ),
        ));
  }
}
