import 'package:flutter/material.dart';
import 'package:flutter_l10n/l10n/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrentLanguage extends StatelessWidget {
  const CurrentLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    return Column(
      children: [
        SizedBox(height: 32.h),
        Text(
          l10n.homeCurrentLanguage(l10n.localeName),
          style: TextStyle(fontSize: 16.sp),
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
