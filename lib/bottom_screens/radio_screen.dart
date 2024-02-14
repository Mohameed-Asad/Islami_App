import 'package:flutter/material.dart';
import 'package:islamii_app/app_manager/theme_manager.dart';
import 'package:provider/provider.dart';

import '../app_manager/settings_provider.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pointer = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        Container(
            height: 350,
            child: Image.asset(
              "assets/Images/radio_image.png",
              height: MediaQuery.of(context).size.height * 0.25,
              alignment: Alignment.bottomCenter,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          child: Text(
            "إذاعة القرآن الكريم",
            style: pointer.isDark()
                ? ThemeDataManager.primaryStyle
                    .copyWith(color: Colors.white, fontSize: 30)
                : ThemeDataManager.primaryStyle.copyWith(fontSize: 30),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_left,
                color: pointer.isDark()
                    ? ThemeDataManager.primaryDarkColor2
                    : ThemeDataManager.primaryColor,
                size: 80,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.pause,
                color: pointer.isDark()
                    ? ThemeDataManager.primaryDarkColor2
                    : ThemeDataManager.primaryColor,
                size: 70,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow,
                color: pointer.isDark()
                    ? ThemeDataManager.primaryDarkColor2
                    : ThemeDataManager.primaryColor,
                size: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
