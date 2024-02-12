import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamii_app/quran/quran_screen.dart';
import 'package:islamii_app/theme_manager.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = "Quran_details";

  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as QuranContent;

    if (quranList.isEmpty) loadData(args.suraNumber);
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/Images/default_bg.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("إسلامي"),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 80),
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "سورة ${args.suraName}",
                          style: ThemeDataManager.primaryStyle,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(Icons.play_circle)
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
                          style: ThemeDataManager.primaryStyle,
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
