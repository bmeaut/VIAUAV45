import 'package:flutter/material.dart';
import 'package:flutter_l10n/l10n/l10n.dart';

class CurrentLanguage extends StatelessWidget {
  const CurrentLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    return Column(
      children: [
        const SizedBox(height: 32),
        Text(
          l10n.homeCurrentLanguage(l10n.localeName),
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Image.asset(
          "assets/icon/flag/${l10n.localeName}.png",
          height: 40,
          width: 60,
        ),
      ],
    );
  }
}
