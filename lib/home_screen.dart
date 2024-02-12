import 'package:flutter/material.dart';
import 'package:islamii_app/hadeth_screen.dart';
import 'package:islamii_app/quran/quran_screen.dart';
import 'package:islamii_app/radio_screen.dart';
import 'package:islamii_app/settings_screen.dart';
import 'package:islamii_app/tasbeh_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 4;
  List<Widget> screensView = [
    SettingsScreen(),
    RadioScreen(),
    TasbehScreen(),
    HadethScreen(),
    QuranScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    return Stack(
      children: [
        Image.asset(
          "assets/Images/default_bg.png",
          width: mediaQuery.width,
          height: mediaQuery.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text("إسلامي"),
          ),
          body: screensView[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "الإعدادات",
              ),
              const BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/Images/icon_radio.png")),
                  label: "راديو"),
              const BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/Images/icon_sebha.png")),
                  label: "التسبيح"),
              const BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/Images/icon_hadeth.png")),
                  label: "الأحاديث"),
              const BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/Images/icon_quran.png")),
                  label: "القرآن"),
            ],
          ),
        )
      ],
    );
  }
}
