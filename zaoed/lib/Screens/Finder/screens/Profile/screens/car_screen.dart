import 'package:zaoed/constants/imports.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: 'بيانات المركبات'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ButtonWidget(
          textEntry: "إضافة",
          onPress: () {
            context.push(view: AddCar());
          },
          backColor: AppColors().green,
          textColor: AppColors().gray9,
        ),
      ),
      backgroundColor: AppColors().gray9,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<CarsBloc, CarsState>(
          builder: (context, state) {
            if (state is CarDataState) {
              return ListView.separated(
                shrinkWrap: true,
                itemCount: state.cars?.length ?? 0,
                itemBuilder: (context, index) {
                  return CarWidget(car: state.cars?[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10);
                },
              );
            }
            return Center(
                child: Text(
              "لاتوجد أي مركبة مضافة حالياٍ",
              style: TextStyle(color: AppColors().white),
            ));
          },
        ),
      )),
    );
  }
}
