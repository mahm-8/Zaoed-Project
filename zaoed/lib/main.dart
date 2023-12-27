import 'package:zaoed/Screens/Provider/Profile/screens/settings_screen.dart';
import 'package:zaoed/Screens/Provider/Profile/screens/statics_screen.dart';
import 'package:zaoed/blocs/actions_bloc/actions_bloc.dart';
import 'package:zaoed/blocs/providor_bloc/provider_bloc.dart';
import 'package:zaoed/constants/imports.dart';
import 'package:zaoed/blocs/auth_bloc/page_bloc/pages_bloc.dart';
import 'package:zaoed/blocs/finder/car_bloc/cars_bloc.dart';
import 'package:zaoed/blocs/finder/user_bloc/user_bloc.dart';
import 'package:zaoed/blocs/providor_bloc/static_bloc/static_bloc.dart';
import 'package:zaoed/Screens/Provider/NavigationBar/navigation_bar.dart';
import 'package:zaoed/blocs/finder_bloc/finder_bloc.dart';

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
          create: (context) => ActionsBloc()..add(GetBookmarkEvent()),
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
        home: SavedBookmarksScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
