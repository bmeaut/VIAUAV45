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
  File? _riveFile;
  RiveWidgetController? _controller;
  StateMachine? _activeStateMachine;
  Object? _loadError;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
  }

  @override
  void dispose() {
    _detachStateMachine();
    _controller?.dispose();
    _riveFile?.dispose();
    super.dispose();
  }

  void setNextAsset() {
    final nextIndex = (_assetIndex + 1) % _artboardStateMachineMapping.length;
    _selectAsset(nextIndex);
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
              child: switch ((_isLoading, _loadError, _controller)) {
                (true, _, _) => const Center(child: CircularProgressIndicator.adaptive()),
                (false, final Object? error, _) when error != null => Center(
                    child: Text(
                      context.l10n.animationLoadingFailed,
                      style: context.textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                (_, _, final RiveWidgetController? controller) when controller != null => RiveWidget(
                    key: ValueKey(currentAnim.key + currentAnim.value),
                    controller: controller,
                  ),
                _ => const SizedBox.shrink(),
              },
            ),
            _AnimationsInfoBox(isRocketsite: isRocketsite),
          ],
        ),
      ),
    );
  }

  Future<void> _loadRiveFile() async {
    try {
      final file = await File.asset(
        Assets.rive.bme,
        riveFactory: Factory.rive,
      );
      if (!mounted) {
        file?.dispose();
        return;
      }
      setState(() {
        _riveFile = file;
        _isLoading = false;
        _loadError = null;
      });
      _selectAsset(_assetIndex);
    } catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _loadError = error;
        _isLoading = false;
      });
    }
  }

  void _selectAsset(int index) {
    final resolvedIndex = index % _artboardStateMachineMapping.length;

    _detachStateMachine();
    final previousController = _controller;
    _controller = null;
    previousController?.dispose();

    RiveWidgetController? newController;
    StateMachine? newStateMachine;
    Object? newError = _loadError;

    final file = _riveFile;
    if (file != null) {
      final entry = _artboardStateMachineMapping[resolvedIndex];
      try {
        newController = RiveWidgetController(
          file,
          artboardSelector: ArtboardSelector.byName(entry.key),
          stateMachineSelector: StateMachineSelector.byName(entry.value),
        );
        newError = null;

        if (entry.key == 'Rocketsite AB') {
          newStateMachine = newController.stateMachine..addEventListener(_handleRiveEvents);
        }
      } catch (error) {
        newController?.dispose();
        newController = null;
        newStateMachine = null;
        newError = error;
      }
    }

    setState(() {
      _assetIndex = resolvedIndex;
      _controller = newController;
      _activeStateMachine = newStateMachine;
      _loadError = newError;
    });
  }

  void _detachStateMachine() {
    _activeStateMachine?.removeEventListener(_handleRiveEvents);
    _activeStateMachine = null;
  }

  void _handleRiveEvents(Event event) {
    if (event.name == 'AnimationEND') {
      Fluttertoast.showToast(
        msg: context.l10n.customEventTriggered,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
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
