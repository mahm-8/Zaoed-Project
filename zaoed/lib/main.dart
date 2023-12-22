import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zaoed/auth/tabbar_login_screen.dart';
import 'package:zaoed/auth/tabviews/login_screen.dart';
import 'package:zaoed/blocs/auth_bloc/auth_bloc.dart';
import 'package:zaoed/finder/screens/Booking/booking_screen.dart';
import 'package:zaoed/service/networking.dart';

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
    return BlocProvider(
      create: (context) => AuthBloc(),
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
        home: TabBarLogin(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
