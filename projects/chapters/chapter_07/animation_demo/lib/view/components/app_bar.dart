import 'package:animation_demo/res/app_dimensions.dart';
import 'package:animation_demo/res/app_theme.dart';
import 'package:animation_demo/res/gen/assets.gen.dart';
import 'package:animation_demo/view/components/outlined_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppTheme.blue500,
                  width: 2,
                ),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppTheme.blue400, AppTheme.white],
              ),
            ),
            child: Opacity(
              opacity: 0.65,
              child: Assets.images.appBarBg.image(fit: BoxFit.cover),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: AppDimensions.w16,
            right: AppDimensions.w16,
            top: MediaQuery.viewPaddingOf(context).top,
            bottom: AppDimensions.h12,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: AppDimensions.h48,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: OutlinedText(
                  text: List<String>.from([
                    'AnimatedSize',
                    'AnimatedContainer',
                    'CurvedAnimation',
                    'AnimationBuilder',
                    'StaggeredAnimation',
                    'AnimatedSvg',
                    'DrawingAnimation',
                    'Lottie',
                    'Rive',
                  ]).elementAt(pageIndex),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
