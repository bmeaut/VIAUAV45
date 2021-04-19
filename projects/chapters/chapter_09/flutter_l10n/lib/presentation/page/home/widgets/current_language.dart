import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common_imports.dart';

class CurrentLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context);
    return Column(
      children: [
        Text(
          l10n.homeTitle,
          style: TextStyle(fontSize: 60.nsp),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 32.h),
        Text(
          l10n.homeCurrentLanguage("TODO"),
          style: TextStyle(
            fontSize: 16.h,
          ),
        ),
        SizedBox(height: 8.h),
        Image.asset(
          "assets/icon/flag/${l10n.localeName}.png",
          height: 40.h,
          width: 60.w,
        ),
      ],
    );
  }
}
