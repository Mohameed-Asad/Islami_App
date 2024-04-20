import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii_app/app_manager/settings_provider.dart';
import 'package:islamii_app/features/Quran/quran_screen.dart';
import 'package:islamii_app/features/Radio/radio_screen.dart';
import 'package:islamii_app/features/Settings/settings_screen.dart';
import 'package:provider/provider.dart';

import 'Hadeth/hadeth_screen.dart';
import 'Tasbeh/tasbeh_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screensView = [
    const QuranScreen(),
    const HadethScreen(),
    const TasbehScreen(),
    const RadioScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    var language = AppLocalizations.of(context)!;
    var pointer = Provider.of<SettingsProvider>(context);
    return Stack(
      children: [
        Image.asset(
          pointer.isDark()
              ? "assets/Images/dark_bg.png"
              : "assets/Images/default_bg.png",
          width: mediaQuery.width,
          height: mediaQuery.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(language.islami),
          ),
          body: screensView[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage("assets/Images/icon_quran.png")),
                  label: language.quran),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage("assets/Images/icon_hadeth.png")),
                  label: language.hadeth),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage("assets/Images/icon_sebha.png")),
                  label: language.sebha),
              BottomNavigationBarItem(
                  icon: const ImageIcon(
                      AssetImage("assets/Images/icon_radio.png")),
                  label: language.radio),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: language.settings,
              ),
            ],
          ),
        )
      ],
    );
  }
}
