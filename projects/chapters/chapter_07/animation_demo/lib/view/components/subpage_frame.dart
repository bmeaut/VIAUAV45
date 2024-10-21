import 'package:animation_demo/res/app_dimensions.dart';
import 'package:animation_demo/utilities/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class SubpageFrame extends StatelessWidget {
  const SubpageFrame({
    super.key,
    required this.body,
    this.buttonCallback,
    this.buttonText,
    this.enableBottomSection = false,
  });

  final Widget body;
  final String? buttonText;
  final void Function()? buttonCallback;
  final bool enableBottomSection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: enableBottomSection
            ? EdgeInsets.fromLTRB(
                AppDimensions.w24,
                AppDimensions.h48,
                AppDimensions.w24,
                0.0,
              )
            : EdgeInsets.symmetric(
                horizontal: AppDimensions.w24,
                vertical: AppDimensions.h48,
              ),
        child: Stack(
          children: [
            Positioned.fill(
              bottom: enableBottomSection ? AppDimensions.h80 : AppDimensions.h120,
              child: Center(child: body),
            ),
            if (buttonCallback != null)
              Positioned(
                bottom: AppDimensions.h32,
                height: AppDimensions.h56,
                left: 0.0,
                right: 0.0,
                child: Center(
                  child: ElevatedButton(
                    onPressed: buttonCallback,
                    child: Text(
                      buttonText ?? context.l10n.startAnimation,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
