import 'package:zaoed/Screens/Provider/Profile/screens/statics_screen.dart';
import 'package:zaoed/blocs/car_bloc/cars_bloc.dart';
import 'package:zaoed/blocs/finder_bloc/bloc/finder_bloc.dart';
import 'package:zaoed/blocs/providor_bloc/provider_bloc.dart';
import 'package:zaoed/blocs/providor_bloc/static_bloc/bloc/static_bloc.dart';
import 'package:zaoed/constants/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  SupabaseNetworking().getSupabaseInitialize;
  SupabaseMethods().getProfit();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => ProviderBloc(),
        ),
        BlocProvider(
          create: (context) => StaticBloc(),
        ),
        BlocProvider(
          create: (context) => PagesBloc(),
        ),
        BlocProvider(
          create: (context) => CarsBloc(),
        ),
        BlocProvider(
          create: (context) => ChatBloc(),
        ),
        BlocProvider(
          create: (context) => FinderBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: "SfArabic"),
        supportedLocales: const [
          Locale("ar"),
        ],
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: StaticsScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
