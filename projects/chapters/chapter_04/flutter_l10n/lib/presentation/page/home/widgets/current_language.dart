import 'package:flutter/material.dart';

import '../../../../common_imports.dart';

class CurrentLanguage extends StatelessWidget {
  const CurrentLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    return Column(
      children: [
        const SizedBox(height: 32),
        Text(
          l10n.homeCurrentLanguage("TODO"),
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
