import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamii_app/Hadeth/hadeth_screen.dart';
import 'package:islamii_app/theme_manager.dart';

class Hadethcontent extends StatefulWidget {
  static const routeName = "HadethContent";

  const Hadethcontent({super.key});

  @override
  State<Hadethcontent> createState() => _HadethcontentState();
}

class _HadethcontentState extends State<Hadethcontent> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethData;

    if (hadethContentList.isEmpty) loadData();
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
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Text(
                      "الحديث رقم ${args.index}",
                      style:
                          ThemeDataManager.primaryStyle.copyWith(fontSize: 28),
                    ),
                    Divider(
                      color: ThemeDataManager.primaryColor,
                      thickness: 2,
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemBuilder: (context, index) => Text(
                        hadethContentList[args.index - 1],
                        style: ThemeDataManager.primaryStyle,
                        textAlign: TextAlign.center,
                      ),
                      itemCount: 1,
                    ))
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

List<String> hadethContentList = [];

Future loadData() async {
  String allHadeth = await rootBundle.loadString("assets/Files/ahadeth.txt");
  List<String> allHadethList = allHadeth.split("#");
  for (int i = 0; i < allHadethList.length; i++) {
    String singleHadeth = allHadethList[i].trim();
    int titleindex = singleHadeth.indexOf("\n");
    String hadethcontent = singleHadeth.substring(titleindex + 1);
    hadethContentList.add(hadethcontent);
  }
}
