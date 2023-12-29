import 'package:zaoed/Screens/Provider/Profile/screens/charging_point_data.dart';
import 'package:zaoed/Screens/loading/loading_screen.dart';
import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/blocs/bottom_sheet_status_bloc/bottom_sheet_status_bloc.dart';
import 'package:zaoed/blocs/providor_bloc/provider_bloc.dart';
import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/blocs/auth_bloc/page_bloc/pages_bloc.dart';
import 'package:zaoed/blocs/card_bloc/card_bloc.dart';
import 'package:zaoed/blocs/finder/car_bloc/cars_bloc.dart';
import 'package:zaoed/blocs/finder/user_bloc/user_bloc.dart';
import 'package:zaoed/blocs/google_map_bloc/google_map_bloc.dart';
import 'package:zaoed/blocs/providor_bloc/static_bloc/static_bloc.dart';
import 'package:zaoed/blocs/finder_bloc/finder_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await SupabaseNetworking().getSupabaseInitialize;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(CheckLoginEvent()),
        ),
        BlocProvider(
          create: (context) => GoogleMapBloc(),
        ),
        BlocProvider(create: (context) => BottomSheetStatusBloc()),
        BlocProvider(
          create: (context) => CardBloc(),
        ),
        BlocProvider(
          create: (context) => StaticBloc(),
        ),
        BlocProvider(
          create: (context) => FinderBloc()..add(LoadDataTimerEvent()),
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
        BlocProvider(
          create: (context) => ActionsBloc()..add(GetChargingPointsEvent()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: "SfArabic",
        ),
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
