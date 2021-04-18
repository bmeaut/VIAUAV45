import 'package:flutter/material.dart';
import 'package:flutter_l10n/domain/model/santa.dart';
import 'package:flutter_l10n/presentation/page/home/widgets/current_language.dart';
import 'package:flutter_l10n/presentation/page/home/widgets/santa_item.dart';

import '../../../common_imports.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeAppbarTitle),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CurrentLanguage(),
            SizedBox(height: 32),
            Text(
              l10n.homeYourSanta,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 8),
            SantaItem(
              santa: Santa(
                  name: l10n.santaName,
                  avatar: "assets/icon/santa.png",
                  outfit: [l10n.santaHat, l10n.santaTie],
                  description: l10n.santaDescription),
            ),
          ],
        ),
      ),
    );
  }
}
