import 'package:animated_svg/animated_svg.dart';
import 'package:animation_demo/res/app_dimensions.dart';
import 'package:animation_demo/res/gen/assets.gen.dart';
import 'package:animation_demo/view/components/subpage_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedSvgDemo extends StatefulWidget {
  const AnimatedSvgDemo({super.key});

  @override
  State<AnimatedSvgDemo> createState() => _AnimatedSvgDemoState();
}

class _AnimatedSvgDemoState extends State<AnimatedSvgDemo> {
  late final SvgController _svgController = AnimatedSvgController();

  @override
  void dispose() {
    _svgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SubpageFrame(
      body: AnimatedSvg(
        controller: _svgController,
        size: AppDimensions.size100,
        children: [
          SvgPicture.asset(Assets.svg.pause.path),
          SvgPicture.asset(Assets.svg.play.path),
        ],
      ),
    );
  }
}
