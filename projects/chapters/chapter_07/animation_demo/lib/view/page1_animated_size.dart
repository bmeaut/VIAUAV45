import 'package:animation_demo/res/app_dimensions.dart';
import 'package:animation_demo/res/app_theme.dart';
import 'package:animation_demo/utilities/extensions/context_extensions.dart';
import 'package:animation_demo/view/components/subpage_frame.dart';
import 'package:flutter/material.dart';

class AnimatedSizeDemo extends StatefulWidget {
  const AnimatedSizeDemo({super.key});

  @override
  State<AnimatedSizeDemo> createState() => _AnimatedSizeDemoState();
}

class _AnimatedSizeDemoState extends State<AnimatedSizeDemo> {
  double _size = AppDimensions.size100;

  void changeSize() {
    setState(() {
      _size == AppDimensions.size100 ? _size = AppDimensions.size300 : _size = AppDimensions.size100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SubpageFrame(
      buttonCallback: changeSize,
      buttonText: _size == AppDimensions.size100 ? null : context.l10n.reverseAnimation,
      body: ColoredBox(
        color: AppTheme.white,
        child: AnimatedSize(
          duration: const Duration(seconds: 2),
          // Step 1:
          child: SizedBox(
            width: _size,
            height: _size,
          ),
          // Step 2:
          /*child: Container(
            width: _size,
            height: _size,
            color: AppTheme.blue500,
          ),*/
        ),
      ),
    );
  }
}
