import 'package:flutter/material.dart';
import 'package:flutter_l10n/domain/model/santa.dart';
import 'package:flutter_l10n/presentation/page/home/widgets/current_language.dart';
import 'package:flutter_l10n/presentation/page/home/widgets/santa_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_imports.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);

    final appBar = AppBar(
      title: Semantics(
        child: Text(l10n.homeAppbarTitle),
        label: "This is the HomePage.",
      ),
    );

    final mediaQuery = MediaQuery.of(context);
    final currentScreenHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    //mediaQuery.orientation == Orientation.portrait

    return Scaffold(
      appBar: appBar,
      body: Container(
        width: double.infinity,
        height: currentScreenHeight,
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CurrentLanguage(),
            SizedBox(height: 32.h),
            Text(
              l10n.homeYourSanta,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontSize: 64.sp),
            ),
            SizedBox(height: 8.h),
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
