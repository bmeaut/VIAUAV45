import 'package:flutter/material.dart';
import 'package:flutter_l10n/l10n/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'presentation/page/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter l10n demo',
          theme: ThemeData(primaryColor: Colors.red),
          localizationsDelegates: L10n.localizationsDelegates,
          supportedLocales: L10n.supportedLocales,
          home: child,
        );
      },
      child: const HomePage(),
    );
  }
}
