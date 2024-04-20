import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii_app/app_manager/settings_provider.dart';
import 'package:islamii_app/app_manager/theme_manager.dart';
import 'package:islamii_app/features/Splash/splash_screen.dart';
import 'package:islamii_app/features/home_screen.dart';
import 'package:provider/provider.dart';

import 'features/Hadeth/hadeth_content.dart';
import 'features/Quran/quran_details.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pointer = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeDataManager.lightTheme,
      darkTheme: ThemeDataManager.darkTheme,
      themeMode: pointer.currentTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(pointer.currentLanguage),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        QuranDetails.routeName: (context) => const QuranDetails(),
        Hadethcontent.routeName: (context) => const Hadethcontent(),
      },
    );
  }
}
