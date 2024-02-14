import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii_app/app_manager/theme_manager.dart';
import 'package:provider/provider.dart';

import 'app_manager/settings_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> languageList = ["عربي", "English"];
  List<String> themeList = ["Light", "Dark"];

  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context)!;
    var pointer = Provider.of<SettingsProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 70, right: 30, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            language.language,
            style: pointer.isDark()
                ? ThemeDataManager.primaryStyle.copyWith(
                    color: ThemeDataManager.primaryDarkColor2, fontSize: 30)
                : ThemeDataManager.primaryStyle.copyWith(
                    fontSize: 30,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, bottom: 25),
            child: CustomDropdown<String>(
              decoration: CustomDropdownDecoration(
                  headerStyle: TextStyle(
                      color: pointer.isDark() ? Colors.white : Colors.black,
                      fontSize: 18),
                  listItemStyle: TextStyle(
                      color: pointer.isDark() ? Colors.white : Colors.black,
                      fontSize: 18),
                  expandedSuffixIcon: Icon(
                    Icons.arrow_drop_up,
                    color: pointer.isDark()
                        ? ThemeDataManager.primaryDarkColor2
                        : Colors.black,
                  ),
                  expandedFillColor: pointer.isDark()
                      ? ThemeDataManager.primaryDarkColor
                      : Colors.white,
                  closedSuffixIcon: Icon(
                    Icons.arrow_drop_down_sharp,
                    color: pointer.isDark()
                        ? ThemeDataManager.primaryDarkColor2
                        : Colors.black,
                  ),
                  closedFillColor: pointer.isDark()
                      ? ThemeDataManager.primaryDarkColor
                      : Colors.white),
              items: languageList,
              initialItem: pointer.currentLanguage == "en" ? "English" : "عربي",
              onChanged: (value) {
                if (value == "English") {
                  pointer.changeLanguage("en");
                } else if (value == "عربي") {
                  pointer.changeLanguage("ar");
                }
              },
            ),
          ),
          Text(
            language.thememode,
            style: pointer.isDark()
                ? ThemeDataManager.primaryStyle.copyWith(
                    color: ThemeDataManager.primaryDarkColor2, fontSize: 30)
                : ThemeDataManager.primaryStyle.copyWith(
                    fontSize: 30,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: CustomDropdown<String>(
              decoration: CustomDropdownDecoration(
                  headerStyle: TextStyle(
                      color: pointer.isDark() ? Colors.white : Colors.black,
                      fontSize: 18),
                  listItemStyle: TextStyle(
                      color: pointer.isDark() ? Colors.white : Colors.black,
                      fontSize: 18),
                  expandedSuffixIcon: Icon(
                    Icons.arrow_drop_up,
                    color: pointer.isDark()
                        ? ThemeDataManager.primaryDarkColor2
                        : Colors.black,
                  ),
                  expandedFillColor: pointer.isDark()
                      ? ThemeDataManager.primaryDarkColor
                      : Colors.white,
                  closedSuffixIcon: Icon(
                    Icons.arrow_drop_down_sharp,
                    color: pointer.isDark()
                        ? ThemeDataManager.primaryDarkColor2
                        : Colors.black,
                  ),
                  closedFillColor: pointer.isDark()
                      ? ThemeDataManager.primaryDarkColor
                      : Colors.white),
              initialItem:
                  pointer.currentTheme == ThemeMode.light ? "Light" : "Dark",
              items: themeList,
              onChanged: (value) {
                if (value == "Light") {
                  pointer.changeTheme(ThemeMode.light);
                } else if (value == "Dark") {
                  pointer.changeTheme(ThemeMode.dark);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
