import 'package:flutter/material.dart';
import 'package:flutter_l10n/domain/model/santa.dart';
import 'package:flutter_l10n/l10n/l10n.dart';
import 'package:flutter_l10n/presentation/page/home/widgets/current_language.dart';
import 'package:flutter_l10n/presentation/page/home/widgets/santa_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Semantics(
          label: "This is the HomePage.",
          child: Text(l10n.homeAppbarTitle),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              l10n.homeTitle,
              style: const TextStyle(fontSize: 60),
              textAlign: TextAlign.center,
            ),
            const CurrentLanguage(),
            const SizedBox(height: 32),
            Text(
              l10n.homeYourSanta,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            SantaCard(
              santa: Santa(
                name: l10n.santaName,
                avatar: "assets/icon/santa.png",
                outfit: [l10n.santaHat, l10n.santaTie],
                description: l10n.santaDescription,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
