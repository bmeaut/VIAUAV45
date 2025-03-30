import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_ar.dart';
import 'l10n_en.dart';
import 'l10n_hu.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('hu')
  ];

  /// Page title.
  ///
  /// In en, this message translates to:
  /// **'Know your Santa'**
  String get homeTitle;

  /// Page title of appbar.
  ///
  /// In en, this message translates to:
  /// **'HomePage'**
  String get homeAppbarTitle;

  /// Show the current language on the Home page
  ///
  /// In en, this message translates to:
  /// **'Current language: {language}'**
  String homeCurrentLanguage(Object language);

  ///
  ///
  /// In en, this message translates to:
  /// **'Your santa'**
  String get homeYourSanta;

  ///
  ///
  /// In en, this message translates to:
  /// **'Santa Claus'**
  String get santaName;

  /// No description provided for @santaHat.
  ///
  /// In en, this message translates to:
  /// **'Hat'**
  String get santaHat;

  /// No description provided for @santaTie.
  ///
  /// In en, this message translates to:
  /// **'Tie'**
  String get santaTie;

  ///
  ///
  /// In en, this message translates to:
  /// **'Jingle bells jingle bells\nJingle all the way\nOh what fun it is to ride\nIn a one horse open sleigh\nJingle bells jingle bells\nJingle all the way\nOh what fun it is to ride\nIn a one horse open sleigh\n\nDashing through the snow\nIn a one horse open sleigh\nOver the fields we go\nLaughing all the way\nBells on bob tail ring\nMaking spirits bright\nOh What fun it is to ride \nA sleighing song tonight\n\nOh, oh jingle bells jingle bells\nJingle all the way\nOh what fun it is to ride\nIn a one horse open sleigh\n\nYou better not pout\nYou better not cry\nYou better not shout\nI\'m telling you why\nSanta Claus is coming to town\n\nHe\'s making a list\nHe\'s checking it twice\nGonna find out\nWho\'s naughty or nice\nSanta Claus is coming to town\n\nHe sees you when you\'re sleeping\nHe knows if you\'re awake\nHe knows if you\'ve been bad or good\nSo be good for goodness sake\n\nI am dreaming of a white Christmas\nJust like the ones I used to know\nWhere the tree tops glisten\nAnd children listen\nTo hear sleighbells in the snow\nI am dreaming of a white Christmas\nWith every Christmas card I write\nMay your days be merry and bright\nAnd may all your Christmases be\n\nOh, the weather outside is frightful\nBut the fire is so delightful\nAnd since we\'ve got no place to go\nLet it snow, let it snow, let it snow\n\nOh, it doesn\'t show signs of stopping\nAnd I\'ve brought some corn for popping\nThe lights are turned way down low\nLet it snow, let it snow, let it snow\n\nWhen we finally kiss goodnight\nHow I\'ll hate going out in the storm\nBut, if you really hold me tight\nAll the way home I\'ll be warm\n\nThe fire is slowly dying\nAnd my dear, we\'re still good by ing\nBut, as long as you love me so\nLet it snow, let it snow, let it snow\n\nHere comes Santa Claus\nHere comes Santa Claus\nRight down Santa Claus Lane\nVixen and Blitzen and all his reindeer\nPullin\' on the reins\nBells are ringin\', children singin\'\nAll is merry and bright\nHang your stockings and say your prayers\nSanta Claus comes tonight\n\nHere comes Santa Claus\nHere comes Santa Claus\nRight down Santa Claus Lane\nHe\'s got a bag that\'s filled with toys\nFor boys and girls again\nHear those sleigh bells jingle jangle\nOh what a beautiful sight\nJump in bed, and cover your head\nSanta Claus comes tonight\nSanta Claus comes tonight'**
  String get santaDescription;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'hu'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return L10nAr();
    case 'en': return L10nEn();
    case 'hu': return L10nHu();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
