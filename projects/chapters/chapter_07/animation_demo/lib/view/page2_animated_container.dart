import 'package:animation_demo/res/app_dimensions.dart';
import 'package:animation_demo/res/app_theme.dart';
import 'package:animation_demo/utilities/extensions/context_extensions.dart';
import 'package:animation_demo/view/components/subpage_frame.dart';
import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({super.key});

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  bool _initialState = true;

  double _size = AppDimensions.size100;
  Color _color = AppTheme.white;
  Alignment _alignment = Alignment.topLeft;

  void changeSize() {
    setState(() {
      if (_initialState) {
        _size = AppDimensions.size300;
        _color = AppTheme.blue500;
        _alignment = Alignment.bottomRight;
      } else {
        _size = AppDimensions.size100;
        _color = AppTheme.white;
        _alignment = Alignment.topLeft;
      }
      _initialState = !_initialState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SubpageFrame(
      buttonCallback: changeSize,
      buttonText: _size == AppDimensions.size100 ? null : context.l10n.reverseAnimation,
      // Step 1: Try animating to & back with the default properties
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        width: _size,
        height: _size,
        color: _color,
        // Step 3: Uncomment the following line as well and try animationg to & back again
        //padding: EdgeInsets.all((_size - AppDimensions.size100) / 2),
        // Step 2: Uncomment the following line and try animationg to & back again
        //child: const FlutterLogo(),
      ),
      // Step 4: Try with these two properties instead and try animationg to & back again
      /* 
      buttonText: _alignment == Alignment.topLeft ? null : context.l10n.reverseAnimation,
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        width: AppDimensions.size300,
        height: AppDimensions.size300,
        color: AppTheme.white,
        alignment: _alignment,
        child: FlutterLogo(size: AppDimensions.size100),
      ),
      */
    );
  }
}
