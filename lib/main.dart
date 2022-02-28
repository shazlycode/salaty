import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salaty/providers/azkar_provider.dart';
import 'package:salaty/providers/prayers_provider.dart';
import 'package:salaty/providers/quran_provider.dart';
import 'package:salaty/screens/azkar_screen.dart';
import 'package:salaty/screens/main_screen.dart';
import 'package:salaty/screens/month.dart';
import 'package:salaty/screens/quran.dart';
import 'package:salaty/screens/share_screen.dart';
import 'package:salaty/screens/splash.dart';
import 'package:salaty/screens/suras_index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PrayerTimesProvider()),
        ChangeNotifierProvider(create: (_) => ZekrProvider()),
        ChangeNotifierProvider(create: (_) => SurasProvider()),
        ChangeNotifierProvider(create: (_) => QuranProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white, fontSize: 15),
            bodyText2: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        home: const Splash(),
        routes: {
          MainScreen.id: (context) => const MainScreen(),
          Month.id: (context) => const Month(),
          ShareScreen.id: (context) => ShareScreen(),
          AzkarScreen.id: (context) => AzkarScreen(),
          QuranScreen.id: (context) => QuranScreen(),
          SurasIndex.id: (context) => SurasIndex()
        },
      ),
    );
  }
}
