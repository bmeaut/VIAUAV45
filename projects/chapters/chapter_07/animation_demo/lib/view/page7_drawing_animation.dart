import 'dart:math';

import 'package:animation_demo/res/app_dimensions.dart';
import 'package:animation_demo/utilities/extensions/context_extensions.dart';
import 'package:animation_demo/view/components/subpage_frame.dart';
import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/material.dart';

class DrawingAnimationDemo extends StatefulWidget {
  const DrawingAnimationDemo({super.key});

  @override
  State<DrawingAnimationDemo> createState() => _DrawingAnimationDemoState();
}

class _DrawingAnimationDemoState extends State<DrawingAnimationDemo> {
  final double _radius = AppDimensions.r12;

  bool _run = false;
  int _circleCount = 1;

  Path get drawingPath {
    final path = Path();
    final n = _circleCount;
    final range = List<int>.generate(n, (i) => i + 1);
    final double angle = 2 * pi / n;
    for (final i in range) {
      final double x = _radius * cos(i * angle);
      final double y = _radius * sin(i * angle);
      path.addOval(Rect.fromCircle(center: Offset(x, y), radius: _radius));
    }
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return SubpageFrame(
      buttonCallback: () => setState(() => _run = !_run),
      buttonText: _run ? context.l10n.stopAnimation : context.l10n.startAnimation,
      body: Center(
        child: AnimatedDrawing.paths(
          [drawingPath],
          paints: [Paint()..style = PaintingStyle.stroke],
          run: _run,
          animationOrder: PathOrders.original,
          duration: const Duration(seconds: 2),
          animationCurve: Curves.linear,
          onFinish: () => setState(
            () {
              _circleCount = _circleCount * 2;
              if (_circleCount >= 200) {
                _circleCount = 2;
              }
            },
          ),
        ),
      ),
    );
  }
}
