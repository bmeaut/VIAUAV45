import 'package:animation_demo/res/app_dimensions.dart';
import 'package:animation_demo/res/app_theme.dart';
import 'package:animation_demo/res/gen/assets.gen.dart';
import 'package:animation_demo/utilities/extensions/context_extensions.dart';
import 'package:animation_demo/view/components/outlined_text.dart';
import 'package:animation_demo/view/components/subpage_frame.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rive/rive.dart';

//
// Basic Rive animation demo page.
//

class RiveAnimationDemo extends StatefulWidget {
  const RiveAnimationDemo({super.key});

  @override
  State<RiveAnimationDemo> createState() => _RiveAnimationDemoState();
}

class _RiveAnimationDemoState extends State<RiveAnimationDemo> {
  // Can be edited in Rive editor.
  // Have to match the artboard & state machine names.
  final _artboardStateMachineMapping = const {
    'Dash': 'Dash SM',
    'Dino': 'Dino SM',
    'Tracker': 'Tracker SM',
    'Rocketsite AB': 'Site SM',
  }.entries.toList();

  int _assetIndex = 0;

  void setNextAsset() {
    setState(() {
      _assetIndex = (_assetIndex + 1) % _artboardStateMachineMapping.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentAnim = _artboardStateMachineMapping[_assetIndex];
    final isRocketsite = currentAnim.key == 'Rocketsite AB';

    return SubpageFrame(
      buttonCallback: setNextAsset,
      buttonText: context.l10n.changeAnimation,
      body: Center(
        child: Column(
          children: [
            if (isRocketsite)
              Padding(
                padding: EdgeInsets.only(bottom: AppDimensions.h12),
                child: OutlinedText(text: context.l10n.forMoreVisit, textStyle: context.textTheme.displaySmall),
              ),
            Expanded(
              child: isRocketsite
                  ? _ComplexRiveAnim(artboard: currentAnim.key, stateMachine: currentAnim.value)
                  : RiveAnimation.asset(
                      key: ValueKey(currentAnim.key + currentAnim.value), // Only for changing artboards correctly
                      Assets.rive.bme.path,
                      artboard: currentAnim.key,
                      stateMachines: [currentAnim.value],
                    ),
            ),
            _AnimationsInfoBox(isRocketsite: isRocketsite),
          ],
        ),
      ),
    );
  }
}

//
// A bit more complex Rive animation handling.
//

class _ComplexRiveAnim extends StatefulWidget {
  _ComplexRiveAnim({
    required this.artboard,
    required this.stateMachine,
  }) : super(key: ValueKey(artboard + stateMachine));

  final String artboard;
  final String stateMachine;

  @override
  State<_ComplexRiveAnim> createState() => _ComplexRiveAnimState();
}

class _ComplexRiveAnimState extends State<_ComplexRiveAnim> {
  StateMachineController? _controller;

  void _handleRiveEvents(RiveEvent event) {
    // Has to match the event name added in Rive editor.
    if (event.name == 'AnimationEND') {
      Fluttertoast.showToast(
        msg: context.l10n.customEventTriggered,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  @override
  void dispose() {
    _controller?.removeEventListener(_handleRiveEvents);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RiveAnimation.asset(
      Assets.rive.bme.path,
      artboard: widget.artboard,
      stateMachines: [widget.stateMachine],
      onInit: (artboard) {
        _controller = StateMachineController.fromArtboard(artboard, 'Site SM');
        if (_controller != null) {
          _controller?.addEventListener(_handleRiveEvents);
          artboard.addController(_controller!);
        }
      },
    );
  }
}

//
// Info box for Rive animations.
//

class _AnimationsInfoBox extends StatelessWidget {
  const _AnimationsInfoBox({required this.isRocketsite});

  final bool isRocketsite;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppDimensions.h32),
      padding: EdgeInsets.symmetric(
        vertical: AppDimensions.h8,
        horizontal: AppDimensions.w16,
      ),
      decoration: BoxDecoration(
        color: AppTheme.blue100,
        borderRadius: BorderRadius.circular(AppDimensions.r12),
        border: Border.all(color: AppTheme.blue500),
      ),
      child: Row(
        children: [
          Icon(
            Icons.warning,
            color: AppTheme.blue500,
            size: AppDimensions.size24,
          ),
          SizedBox(width: AppDimensions.w12),
          Expanded(
            child: Text(
              isRocketsite ? context.l10n.riveLastHint : context.l10n.riveHint,
              style: context.textTheme.bodyMedium,
              textAlign: isRocketsite ? TextAlign.start : TextAlign.center,
            ),
          ),
          SizedBox(width: AppDimensions.w12 + AppDimensions.size24),
        ],
      ),
    );
  }
}
