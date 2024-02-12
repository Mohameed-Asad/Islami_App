import 'package:flutter/material.dart';
import 'package:islamii_app/Hadeth/hadeth_content.dart';
import 'package:islamii_app/theme_manager.dart';

class HadethScreen extends StatelessWidget {
  const HadethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaquery = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          "assets/Images/hadeth_logo.png",
          height: mediaquery.height * 0.25,
        ),
        Divider(
          color: ThemeDataManager.primaryColor,
          thickness: 2,
        ),
        Text(
          "الأحاديث",
          style: ThemeDataManager.primaryStyle,
        ),
        Divider(
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
                  arguments: HadethData(index + 1),
                );
              },
              child: Text(
                "الحديث رقم ${index + 1}",
                style: ThemeDataManager.primaryStyle.copyWith(height: 2),
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

class HadethData {
  final int index;

  HadethData(this.index);
}
