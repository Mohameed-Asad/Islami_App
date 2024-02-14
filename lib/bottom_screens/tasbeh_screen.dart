import 'package:flutter/material.dart';
import 'package:islamii_app/app_manager/theme_manager.dart';
import 'package:provider/provider.dart';

import '../app_manager/settings_provider.dart';

class TasbehScreen extends StatefulWidget {
  const TasbehScreen({super.key});

  @override
  State<TasbehScreen> createState() => _TasbehScreenState();
}

class _TasbehScreenState extends State<TasbehScreen> {
  int counter = 0;
  int value = 0;
  double angel = 0;
  List<String> tasbeh = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "استغفر الله",
    "الله اكبر"
  ];

  @override
  Widget build(BuildContext context) {
    var pointer = Provider.of<SettingsProvider>(context);
    Size mediaquery = MediaQuery.of(context).size;
    return Container(
      width: mediaquery.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Image.asset(pointer.isDark()
                ? "assets/Images/head_sebha_dark.png"
                : "assets/Images/head_sebha_logo.png"),
            GestureDetector(
              onTap: () {
                counter++;
                angel += 90;
                if (counter == 33) {
                  counter = 0;
                  value++;
                }
                if (value == 5) {
                  value = 0;
                }
                setState(() {});
              },
              child: Transform.rotate(
                angle: angel,
                child: Image.asset(pointer.isDark()
                    ? "assets/Images/body_sebha_dark.png"
                    : "assets/Images/body_sebha_logo.png"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "عدد التسبيحات",
              style: pointer.isDark()
                  ? ThemeDataManager.primaryStyle.copyWith(color: Colors.white)
                  : ThemeDataManager.primaryStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 55,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: pointer.isDark()
                      ? ThemeDataManager.primaryDarkColor
                      : ThemeDataManager.primaryColor),
              child: Text(
                "$counter",
                style: pointer.isDark()
                    ? ThemeDataManager.primaryStyle
                        .copyWith(color: Colors.white)
                    : ThemeDataManager.primaryStyle,
              ),
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(17),
              width: 170,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: pointer.isDark()
                      ? ThemeDataManager.primaryDarkColor2
                      : ThemeDataManager.primaryColor),
              child: Text(
                "${tasbeh[value]}",
                style: pointer.isDark()
                    ? ThemeDataManager.primaryStyle.copyWith(
                        color: ThemeDataManager.primaryDarkColor, fontSize: 20)
                    : ThemeDataManager.primaryStyle.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
