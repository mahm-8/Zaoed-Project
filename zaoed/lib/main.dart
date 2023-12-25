import 'package:zaoed/blocs/car_bloc/cars_bloc.dart';
import 'package:zaoed/blocs/providor_bloc/provider_bloc.dart';
import 'package:zaoed/constants/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  SupabaseNetworking().getSupabaseInitialize;
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
          create: (context) => PagesBloc(),
        ),
        BlocProvider(
          create: (context) => CarsBloc(),
        ),
        BlocProvider(
          create: (context) => ChatBloc(),
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
        home: NavigationBarScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
