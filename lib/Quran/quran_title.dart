import 'package:flutter/material.dart';
import 'package:islamii_app/app_manager/theme_manager.dart';
import 'package:provider/provider.dart';

import '../app_manager/settings_provider.dart';

class QuranData extends StatelessWidget {
  final String suraName;
  final String suraNumber;

  const QuranData(
      {super.key, required this.suraName, required this.suraNumber});

  @override
  Widget build(BuildContext context) {
    var pointer = Provider.of<SettingsProvider>(context);
    return Row(
      children: [
        Expanded(
            child: Text(
          suraName,
          style: pointer.isDark()
              ? ThemeDataManager.primaryStyle.copyWith(
                  color: Colors.white,
                )
              : ThemeDataManager.primaryStyle,
          textAlign: TextAlign.center,
        )),
        Container(
          width: 2,
          height: 40,
          color: ThemeDataManager.primaryColor,
        ),
        Expanded(
            child: Text(
          suraNumber,
          style: pointer.isDark()
              ? ThemeDataManager.primaryStyle.copyWith(
                  color: Colors.white,
                )
              : ThemeDataManager.primaryStyle,
          textAlign: TextAlign.center,
        ))
      ],
    );
  }
}
