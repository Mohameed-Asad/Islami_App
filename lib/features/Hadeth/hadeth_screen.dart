import 'package:flutter/material.dart';
import 'package:islamii_app/app_manager/theme_manager.dart';
import 'package:provider/provider.dart';

import '../../app_manager/settings_provider.dart';
import 'hadeth_content.dart';

class HadethScreen extends StatelessWidget {
  const HadethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pointer = Provider.of<SettingsProvider>(context);
    Size mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          "assets/Images/hadeth_logo.png",
          height: mediaQuery.height * 0.25,
        ),
        const Divider(
          color: ThemeDataManager.primaryColor,
          thickness: 2,
        ),
        Text(
          "الأحاديث",
          style: pointer.isDark()
              ? ThemeDataManager.primaryStyle.copyWith(
                  color: Colors.white,
                )
              : ThemeDataManager.primaryStyle,
        ),
        const Divider(
          color: ThemeDataManager.primaryColor,
          thickness: 2,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Hadethcontent.routeName,
                  arguments: index + 1,
                );
              },
              child: Text(
                "الحديث رقم ${index + 1}",
                style: pointer.isDark()
                    ? ThemeDataManager.primaryStyle
                        .copyWith(color: Colors.white, height: 2)
                    : ThemeDataManager.primaryStyle.copyWith(height: 2),
                textAlign: TextAlign.center,
              ),
            ),
            itemCount: 50,
          ),
        )
      ],
    );
  }
}
