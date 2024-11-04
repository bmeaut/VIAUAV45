import 'package:animation_demo/res/app_dimensions.dart';
import 'package:animation_demo/res/app_theme.dart';
import 'package:animation_demo/utilities/extensions/context_extensions.dart';
import 'package:animation_demo/view/components/outlined_text.dart';
import 'package:animation_demo/view/components/subpage_frame.dart';
import 'package:flutter/material.dart';

class CurvedAnimationDemo extends StatefulWidget {
  const CurvedAnimationDemo({super.key});

  @override
  State<CurvedAnimationDemo> createState() => _CurvedAnimationDemoState();
}

class _CurvedAnimationDemoState extends State<CurvedAnimationDemo> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late Animation<double> _animation;

  final List<String> _titles = [
    'EaseIn',
    'BounceIn',
    'EaseInExpo',
    'ElasticIn',
    'SlowMiddle',
  ];

  final List<Curve> _curves = [
    Curves.easeIn,
    Curves.bounceIn,
    Curves.easeInExpo,
    Curves.elasticIn,
    Curves.slowMiddle,
  ];

  int _curveIndex = 0;
  bool _initialState = true;

  void _animationListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _animationController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      _animationController.forward();
    }
  }

  void _setupAnimation() {
    _animation = CurvedAnimation(parent: _animationController, curve: _curves[_curveIndex])
      ..addStatusListener(_animationListener);
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _setupAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void onButtonClick() {
    if (_initialState) {
      setState(() {
        _initialState = false;
        _animationController.forward();
      });
    } else {
      setState(() {
        _animation.removeStatusListener(_animationListener);
        _curveIndex != (_curves.length - 1) ? _curveIndex++ : _curveIndex = 0;
        _setupAnimation();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SubpageFrame(
      buttonCallback: onButtonClick,
      buttonText: _initialState ? null : context.l10n.changeCurve,
      body: Column(
        children: [
          SizedBox(
            height: AppDimensions.h40,
            child: _initialState
                ? null
                : FittedBox(
                    child: OutlinedText(
                      text: _titles[_curveIndex],
                    ),
                  ),
          ),
          const Expanded(child: SizedBox()),
          CurvedAnimationContainer(animation: _animation),
          const Expanded(child: SizedBox()),
          SizedBox(height: AppDimensions.h40),
        ],
      ),
    );
  }
}

class CurvedAnimationContainer extends AnimatedWidget {
  CurvedAnimationContainer({super.key, required Animation<double> animation}) : super(listenable: animation);

  final _colorTween = ColorTween(
    begin: AppTheme.white,
    end: AppTheme.blue500,
  );
  final _sizeTween = Tween<double>(begin: AppDimensions.size100, end: AppDimensions.size300);
  late final _animation = listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: _sizeTween.evaluate(_animation),
        width: _sizeTween.evaluate(_animation),
        color: _colorTween.evaluate(_animation),
      ),
    );
  }
}
