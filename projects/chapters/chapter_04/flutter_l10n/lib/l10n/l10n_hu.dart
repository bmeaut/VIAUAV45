// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class L10nHu extends L10n {
  L10nHu([String locale = 'hu']) : super(locale);

  @override
  String get homeTitle => 'Ismerd meg a Mikulásod';

  @override
  String get homeAppbarTitle => 'Kezdőlap';

  @override
  String homeCurrentLanguage(Object language) {
    return 'Aktuális nyelv: $language';
  }

  @override
  String get homeYourSanta => 'A mikulásod';

  @override
  String get santaName => 'Mikulás';

  @override
  String get santaHat => 'Kalap';

  @override
  String get santaTie => 'Nyaktekerészeti mellfekvenc';

  @override
  String get santaDescription => 'Hull a pelyhes fehér hó,\njöjj el kedves télapó.\nMinden gyermek várva vár,\nvidám ének hangja száll.\nVan zsákodban minden jó,\npiros alma, mogyoró.\nJöjj el hozzánk, várunk rád,\nkedves öreg télapó!\n\nNagyszakállú télapó,\njó gyermek barátja.\nCukrot, diót, mogyorót\nrejteget a zsákja.\nAmerre jár reggelig,\nkis cipőcske megtelik.\nMegtölti a télapó,\nha üresen látja.';
}
