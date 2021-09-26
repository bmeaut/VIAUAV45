import 'package:flutter/material.dart';
import 'package:flutter_l10n/domain/model/santa.dart';
import 'package:flutter_l10n/presentation/page/home/widgets/current_language.dart';
import 'package:flutter_l10n/presentation/page/home/widgets/santa_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Semantics(
          child: Text('HomePage'),
          label: "This is the HomePage.",
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CurrentLanguage(),
            const SizedBox(height: 32),
            Text(
              'Your santa',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 8),
            SantaCard(
              santa: Santa(
                  name: "Santa Claus",
                  avatar: "assets/icon/santa.png",
                  outfit: ["Hat", "Tie"],
                  description: "santaDescription"),
            ),
          ],
        ),
      ),
    );
  }
}
