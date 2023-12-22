import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zaoed/bookmark_screens/saved_bookmarks_screen.dart';
import 'package:zaoed/customer_service_chat/chat_screen.dart';
import 'package:zaoed/finder/screens/Booking/booking_screen.dart';
import 'package:zaoed/finder/screens/Booking/scan_screen/scan_screen.dart';
import 'package:zaoed/finder/screens/payment/payment_process_screen.dart';
import 'package:zaoed/finder/screens/payment/purchase_screen.dart';
import 'package:zaoed/home/map_home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
