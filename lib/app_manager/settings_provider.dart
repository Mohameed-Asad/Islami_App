import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsProvider extends ChangeNotifier {
  String currentLanguage = "ar";
  ThemeMode currentTheme = ThemeMode.light;
  List<String> quranList = [];
  List<String> hadethContentList = [];

  changeLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    notifyListeners();
  }

  changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }

  Future loadQuranData(String suraNumber) async {
    String content =
        await rootBundle.loadString("assets/Files/$suraNumber.txt");
    quranList = content.split("\n");
    notifyListeners();
  }

  Future loadHadethData() async {
    String allHadeth = await rootBundle.loadString("assets/Files/ahadeth.txt");
    List<String> allHadethList = allHadeth.split("#");
    for (int i = 0; i < allHadethList.length; i++) {
      String singleHadeth = allHadethList[i].trim();
      int titleindex = singleHadeth.indexOf("\n");
      String hadethcontent = singleHadeth.substring(titleindex + 1);
      hadethContentList.add(hadethcontent);
    }
    notifyListeners();
  }
}
