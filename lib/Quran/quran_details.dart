import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii_app/app_manager/theme_manager.dart';
import 'package:islamii_app/quran/quran_screen.dart';
import 'package:provider/provider.dart';

import '../app_manager/settings_provider.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = "Quran_details";

  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  @override
  Widget build(BuildContext context) {
    var pointer = Provider.of<SettingsProvider>(context);
    var language = AppLocalizations.of(context)!;
    var args = ModalRoute.of(context)?.settings.arguments as QuranContent;

    if (quranList.isEmpty) loadData(args.suraNumber);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                pointer.isDark()
                    ? "assets/Images/dark_bg.png"
                    : "assets/Images/default_bg.png",
              ),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            language.islami,
          ),
        ),
        body: Padding(
          padding:
          const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 80),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: pointer.isDark()
                    ? ThemeDataManager.primaryDarkColor.withOpacity(0.6)
                    : Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_circle,
                          color: pointer.isDark()
                              ? ThemeDataManager.primaryDarkColor2
                              : Colors.black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "سورة ${args.suraName}",
                          style: pointer.isDark()
                              ? ThemeDataManager.primaryStyle.copyWith(
                                  color: ThemeDataManager.primaryDarkColor2)
                              : ThemeDataManager.primaryStyle,
                        ),
                      ],
                    ),
                    const Divider(
                      color: ThemeDataManager.primaryColor,
                      thickness: 2,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => Text(
                          quranList[index],
                          style: pointer.isDark()
                              ? ThemeDataManager.primaryStyle.copyWith(
                                  color: ThemeDataManager.primaryDarkColor2)
                              : ThemeDataManager.primaryStyle,
                          textAlign: TextAlign.center,
                        ),
                        itemCount: quranList.length,
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  List<String> quranList = [];

  Future loadData(String suraNumber) async {
    String content =
        await rootBundle.loadString("assets/Files/$suraNumber.txt");
    quranList = content.split("\n");
    setState(() {});
  }
}
