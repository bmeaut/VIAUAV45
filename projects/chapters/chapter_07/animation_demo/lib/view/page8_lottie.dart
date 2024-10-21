import 'package:animation_demo/res/gen/assets.gen.dart';
import 'package:animation_demo/utilities/extensions/context_extensions.dart';
import 'package:animation_demo/view/components/subpage_frame.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieDemo extends StatefulWidget {
  const LottieDemo({super.key});

  @override
  State<LottieDemo> createState() => _LottieDemoState();
}

class _LottieDemoState extends State<LottieDemo> {
  final List<String> _assetPaths = [
    Assets.lottie.batteryOptimizations.path,
    Assets.lottie.bluetoothscanning.path,
    Assets.lottie.playing.path,
  ];

  int _assetIndex = 0;

  void setNextAsset() {
    setState(() {
      _assetIndex = (_assetIndex + 1) % _assetPaths.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SubpageFrame(
      buttonCallback: setNextAsset,
      buttonText: context.l10n.changeAnimation,
      body: Lottie.asset(_assetPaths[_assetIndex]),
    );
  }
}
