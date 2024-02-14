import 'package:flutter/material.dart';
import 'package:islamii_app/app_manager/theme_manager.dart';
import 'package:islamii_app/quran/quran_details.dart';
import 'package:islamii_app/quran/quran_title.dart';
import 'package:provider/provider.dart';

import '../app_manager/settings_provider.dart';

class QuranScreen extends StatelessWidget {
  List<String> suraName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج"
        "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pointer = Provider.of<SettingsProvider>(context);
    return Column(children: [
      Image.asset(
        "assets/Images/qur2an_screen_logo.png",
        height: MediaQuery.of(context).size.height * 0.20,
      ),
      const Divider(
        color: ThemeDataManager.primaryColor,
        thickness: 2,
      ),
      Row(
        children: [
          Expanded(
              child: Text(
            "إسم السورة",
            style: pointer.isDark()
                ? ThemeDataManager.primaryStyle.copyWith(
                    color: Colors.white,
                  )
                : ThemeDataManager.primaryStyle,
            textAlign: TextAlign.center,
          )),
          Container(
            width: 2,
            height: 35,
            color: ThemeDataManager.primaryColor,
          ),
          Expanded(
              child: Text(
            "عدد الآيات",
            style: pointer.isDark()
                ? ThemeDataManager.primaryStyle.copyWith(
                    color: Colors.white,
                  )
                : ThemeDataManager.primaryStyle,
            textAlign: TextAlign.center,
          )),
        ],
      ),
      const Divider(
        color: ThemeDataManager.primaryColor,
        thickness: 2,
      ),
      Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, QuranDetails.routeName,
                  arguments: QuranContent(
                      suraName: suraName[index],
                      suraNumber: (index + 1).toString()));
            },
            child: QuranData(
                suraName: suraName[index], suraNumber: (index + 1).toString()),
          ),
          itemCount: suraName.length,
        ),
      ),
    ]);
  }
}

class QuranContent {
  final String suraName;
  final String suraNumber;

  QuranContent({required this.suraName, required this.suraNumber});
}
