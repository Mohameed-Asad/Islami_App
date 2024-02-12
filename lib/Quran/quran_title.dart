import 'package:flutter/material.dart';
import 'package:islamii_app/theme_manager.dart';

class QuranData extends StatelessWidget {
  final String suraName;
  final String suraNumber;

  const QuranData(
      {super.key, required this.suraName, required this.suraNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          suraNumber,
          style: ThemeDataManager.primaryStyle,
          textAlign: TextAlign.center,
        )),
        Container(
          width: 2,
          height: 40,
          color: ThemeDataManager.primaryColor,
        ),
        Expanded(
            child: Text(
          suraName,
          style: ThemeDataManager.primaryStyle,
          textAlign: TextAlign.center,
        ))
      ],
    );
  }
}
