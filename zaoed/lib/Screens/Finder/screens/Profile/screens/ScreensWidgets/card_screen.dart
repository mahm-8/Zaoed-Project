import 'package:zaoed/blocs/card_bloc/card_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: 'البطاقات'),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          context.push(view: AddCard());
        },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            foregroundColor: AppColors().gray8,
            minimumSize: Size(context.getWidth(divide: 1.1), 40),
            backgroundColor: AppColors().green),
        child: const Text("إضافة بطاقة"),
      ),
      backgroundColor: AppColors().gray9,
      body: SafeArea(child: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          if (state is GetCardDataState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ...state.cards.map(
                    (e) => Card(
                      color: AppColors().gray6,
                      child: ListTile(
                        leading: Image.asset("lib/assets/icons/mastercard.png"),
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
