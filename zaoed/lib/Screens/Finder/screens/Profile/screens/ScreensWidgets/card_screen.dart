import 'package:zaoed/constants/imports.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: 'البطاقات'),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: ButtonWidget(
            textEntry: "إضافة بطاقة",
            onPress: () {
              context.push(view: AddCard());
            },
            backColor: AppColors().green,
            textColor: AppColors().gray8),
      ),
      backgroundColor: AppColors().gray9,
      body: SafeArea(child: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          if (state is GetCardDataState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ...state.cards.map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Card(
                        color: AppColors().gray6,
                        child: ListTile(
                          leading:
                              Image.asset("lib/assets/icons/mastercard.png"),
                          title: Text(
                              e?.numberCard?.substring(12).padLeft(10, "*") ??
                                  ""),
                          trailing: TextButton(
                              onPressed: () {},
                              child: Text(
                                "تعديل",
                                style: TextStyle(
                                    fontSize: 18, color: AppColors().blue),
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return Center(
              child: Text(
            "لاتوجد أي بطاقة مضافة حالياٍ",
            style: TextStyle(color: AppColors().white),
          ));
        },
      )),
    );
  }
}
