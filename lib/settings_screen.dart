import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:islamii_app/theme_manager.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> language = ["عربي", "English"];
  List<String> themeList = ["Light", "Dark"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "اللغة",
            style: ThemeDataManager.primaryStyle.copyWith(
              fontSize: 30,
            ),
            textAlign: TextAlign.end,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 25),
            child: CustomDropdown(
              items: language,
              onChanged: (value) {},
            ),
          ),
          Text(
            "السمة",
            style: ThemeDataManager.primaryStyle.copyWith(
              fontSize: 30,
            ),
            textAlign: TextAlign.end,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: CustomDropdown(
              items: themeList,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
