import 'package:flutter/material.dart';
import 'package:flutter_l10n/domain/model/warrior.dart';
import 'package:flutter_l10n/presentation/page/home/widgets/warrior_item.dart';

class HomePage extends StatelessWidget {
  final warrior = Warrior(
      avatar: "https://miro.medium.com/max/900/1*Kf497eBBikYQSwm3o97-VA.png",
      name: "Dr. Jekyll and Mr. Hyde",
      outfit: ["kalap", "nyaktekerészeti mellfekvenc"],
      description:
          " A Hétszűnyű maga volt a világ királya, az ősapa mielőtt a sárkányok előjöttek volna. Hasonlóképpen a Hétszűnyű archetipikus képe azonosítható a Fehérlófiát próbák elé állító öregemberrel, akinek a tanácsára a főhős háromszor hét évig szopja anyja tejét.");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Warrior seminary",
              style: TextStyle(fontSize: 80),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Current language: "),
                Text("English"),
              ],
            ),
            SizedBox(height: 4),
            Image.network(
              "https://faludiakademia.hu/wp-content/uploads/2020/07/flag-of-great-britain-flag-of-the-united-kingdom-english-flag.png",
              height: 64,
              width: 64,
            ),
            SizedBox(height: 32),
            Text(
              "Your warrior",
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 8),
            WarriorItem(
              warrior: warrior,
            ),
          ],
        ),
      ),
    );
  }
}
