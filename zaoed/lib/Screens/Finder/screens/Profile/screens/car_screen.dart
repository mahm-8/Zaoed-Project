import 'package:zaoed/Screens/Finder/screens/Profile/widgets/car_widget.dart';
import 'package:zaoed/blocs/finder/car_bloc/cars_bloc.dart';
import 'package:zaoed/constants/imports.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: 'بيانات المركبات'),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          context.push(view: AddCar());
        },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            foregroundColor: AppColors().gray8,
            minimumSize: Size(context.getWidth(divide: 1.1), 40),
            backgroundColor: AppColors().green),
        child: const Text(
          "إضافة",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  return SizedBox(height: 10);
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
