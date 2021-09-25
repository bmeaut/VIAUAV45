import 'package:flutter/material.dart';

import '../../../../common_imports.dart';

class CurrentLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    return Column(
      children: [
        Text(
          l10n.homeTitle,
          style: TextStyle(fontSize: 60),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 32),
        Text(
          l10n.homeCurrentLanguage("TODO"),
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Image.asset(
          "assets/icon/flag/${l10n.localeName}.png",
          height: 40,
          width: 60,
        ),
      ],
    );
  }
}
