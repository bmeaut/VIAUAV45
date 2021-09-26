import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';

import 'presentation/page/home/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter l10n demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: const HomePage(),

      /// TODO: 2 - Add delegates and supported locales to App.
      /* localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('hu', ''), // Hungarian, no country code
      ],*/

      /// TODO: 7 - Import L10n class and use its shorter localizationsDelegates and supportedLocales properties of L10n class.
      /// TODO: 8 - Optional we could export the import of l10n generated class.
    );
  }
}
