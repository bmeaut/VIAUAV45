import 'package:flutter/material.dart';
import 'package:flutter_l10n/l10n/l10n.dart';

import 'presentation/page/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter l10n demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.red),
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      home: const HomePage(),
    );
  }
}
