// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get changeAnimation => 'Change animation';

  @override
  String get changeCurve => 'Change curve';

  @override
  String get customEventTriggered => 'Custom event triggered!';

  @override
  String get forMoreVisit => 'For more:';

  @override
  String get nonRebuiltWidget => 'Non-rebuilt\nwidget';

  @override
  String get reverseAnimation => 'Reverse animation';

  @override
  String get riveHint => 'Click on the animation.';

  @override
  String get riveLastHint =>
      'Hover state was disabled for mobile, click one for hover effect, click again to reset.';

  @override
  String get staggeredAnimation => 'Staggered Animation';

  @override
  String get startAnimation => 'Start animation';

  @override
  String get stopAnimation => 'Stop animation';

  @override
  String get animationLoadingFailed => 'Failed to load animation';
}
