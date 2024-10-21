import 'package:animation_demo/res/app_theme.dart';
import 'package:animation_demo/res/gen/fonts.gen.dart';
import 'package:animation_demo/utilities/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class OutlinedText extends StatelessWidget {
  const OutlinedText({super.key, required this.text, this.textStyle});

  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Text(
          text,
          style: (textStyle ?? context.textTheme.displayMedium)?.copyWith(
            fontFamily: FontFamily.anton,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 5
              ..color = AppTheme.black,
          ),
        ),
        Text(
          text,
          style: (textStyle ?? context.textTheme.displayMedium)?.copyWith(
            fontFamily: FontFamily.anton,
            color: AppTheme.white,
          ),
        ),
      ],
    );
  }
}
