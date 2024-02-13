import 'package:flutter/material.dart';
import 'package:islamii_app/theme_manager.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 350,
            child: Image.asset(
              "assets/Images/radio_image.png",
              height: MediaQuery.of(context).size.height * 0.25,
              alignment: Alignment.bottomCenter,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          child: Text(
            "إذاعة القرآن الكريم",
            style: ThemeDataManager.primaryStyle.copyWith(fontSize: 30),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_left,
                color: ThemeDataManager.primaryColor,
                size: 80,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.pause,
                color: ThemeDataManager.primaryColor,
                size: 70,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow,
                color: ThemeDataManager.primaryColor,
                size: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
