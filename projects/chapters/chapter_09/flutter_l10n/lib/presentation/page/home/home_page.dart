import 'package:flutter/material.dart';
import 'package:flutter_l10n/domain/model/santa.dart';
import 'package:flutter_l10n/presentation/page/home/widgets/santa_item.dart';

class HomePage extends StatelessWidget {
  final santa = Santa(
      name: "Santa Claus",
      avatar: "assets/icon/santa.png",
      outfit: ["kalap", "nyaktekerészeti mellfekvenc"],
      description:
          "Santa Claus is generally depicted as a portly, jolly, white-bearded man, often with spectacles, wearing a red coat with white fur collar and cuffs, white-fur-cuffed red trousers, red hat with white fur, and black leather belt and boots, carrying a bag full of gifts for children. He is commonly portrayed as laughing in a way that sounds like ho ho ho. ");

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
              "Know your Santa",
              style: TextStyle(fontSize: 40),
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
              "Your santa",
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 8),
            SantaItem(
              santa: santa,
            ),
          ],
        ),
      ),
    );
  }
}
