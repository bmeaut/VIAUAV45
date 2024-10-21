import 'dart:async';

import 'package:animation_demo/res/app_dimensions.dart';
import 'package:animation_demo/res/app_theme.dart';
import 'package:animation_demo/res/gen/assets.gen.dart';
import 'package:animation_demo/utilities/extensions/context_extensions.dart';
import 'package:animation_demo/view/components/subpage_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StaggerDemo extends StatefulWidget {
  const StaggerDemo({super.key});

  @override
  State<StaggerDemo> createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(duration: const Duration(seconds: 5), vsync: this);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    await _controller.forward().orCancel;
    await _controller.reverse().orCancel;
  }

  @override
  Widget build(BuildContext context) {
    return SubpageFrame(
      enableBottomSection: true,
      body: Stack(
        children: [
          _StaggerAnimation(controller: _controller),
          Positioned(
            bottom: 0.0,
            height: AppDimensions.h56,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: InkWell(
                onTap: _playAnimation,
                child: Container(
                  width: AppDimensions.w142,
                  height: AppDimensions.h36,
                  color: AppTheme.transparent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StaggerAnimation extends StatelessWidget {
  _StaggerAnimation({required this.controller})
      : _opacity = Tween<double>(
          begin: 1.0,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.0,
              0.100,
              curve: Curves.ease,
            ),
          ),
        ),
        _imageOpacity = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.375,
              1,
              curve: Curves.ease,
            ),
          ),
        ),
        _width = Tween<double>(
          begin: AppDimensions.w160,
          end: AppDimensions.w240,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.125,
              0.250,
              curve: Curves.ease,
            ),
          ),
        ),
        _height = Tween<double>(begin: AppDimensions.h40, end: AppDimensions.h120).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.250,
              0.375,
              curve: Curves.ease,
            ),
          ),
        ),
        _padding = EdgeInsetsTween(
          begin: EdgeInsets.only(bottom: AppDimensions.h12),
          end: EdgeInsets.only(bottom: AppDimensions.h320),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.250,
              0.375,
              curve: Curves.ease,
            ),
          ),
        ),
        _borderRadius = BorderRadiusTween(
          begin: BorderRadius.circular(AppDimensions.r12),
          end: BorderRadius.circular(AppDimensions.r80),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.375,
              1,
              curve: Curves.ease,
            ),
          ),
        ),
        _color = ColorTween(
          begin: AppTheme.blue700,
          end: AppTheme.white,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.375,
              1,
              curve: Curves.ease,
            ),
          ),
        ),
        _borderColor = ColorTween(
          begin: AppTheme.transparent,
          end: const Color.fromRGBO(0, 161, 245, 1),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.375,
              1,
              curve: Curves.ease,
            ),
          ),
        ),
        _borderWidth = Tween<double>(begin: 0.0, end: AppDimensions.r4).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.375,
              1,
              curve: Curves.ease,
            ),
          ),
        );

  final Animation<double> controller;
  final Animation<double> _opacity;
  final Animation<double> _imageOpacity;
  final Animation<double> _width;
  final Animation<double> _height;
  final Animation<EdgeInsets> _padding;
  final Animation<BorderRadius?> _borderRadius;
  final Animation<Color?> _color;
  final Animation<Color?> _borderColor;
  final Animation<double> _borderWidth;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return Stack(
      children: [
        Container(
          padding: _padding.value,
          alignment: Alignment.bottomCenter,
          child: Container(
            height: _height.value,
            width: _width.value,
            padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.w24,
              vertical: AppDimensions.h12,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _color.value,
              border: Border.all(color: _borderColor.value ?? AppTheme.transparent, width: _borderWidth.value),
              borderRadius: _borderRadius.value,
            ),
            child: Opacity(
              opacity: _opacity.value,
              child: Text(
                context.l10n.startAnimation,
                style: const TextStyle(color: AppTheme.white, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: AppDimensions.h360,
          child: Opacity(
            opacity: _imageOpacity.value,
            child: Center(
              child: SvgPicture.asset(
                Assets.svg.mobile.path,
                height: AppDimensions.h48,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}
