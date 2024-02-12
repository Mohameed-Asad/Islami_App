import 'package:flutter/material.dart';
import 'package:islamii_app/Hadeth/hadeth_content.dart';
import 'package:islamii_app/home_screen.dart';
import 'package:islamii_app/quran/quran_details.dart';
import 'package:islamii_app/splash_screen.dart';
import 'package:islamii_app/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeDataManager.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        QuranDetails.routeName: (context) => QuranDetails(),
        Hadethcontent.routeName: (context) => Hadethcontent(),
      },
    );
  }
}
