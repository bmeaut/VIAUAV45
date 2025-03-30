// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class L10nAr extends L10n {
  L10nAr([String locale = 'ar']) : super(locale);

  @override
  String get homeTitle => 'قابل سانتا الخاص بك';

  @override
  String get homeAppbarTitle => 'الصفحة الرئيسية';

  @override
  String homeCurrentLanguage(Object language) {
    return 'اللغة الحالية: $language';
  }

  @override
  String get homeYourSanta => 'بابا نويل الخاص بك';

  @override
  String get santaName => 'بابا نويل';

  @override
  String get santaHat => 'قبعة';

  @override
  String get santaTie => 'ربطة عنق';

  @override
  String get santaDescription => 'لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل ليتصور طريقه وضع النصوص بالتصاميم سواء كانت تصاميم مطبوعه ... بروشور او فلاير على سبيل المثال ... او نماذج مواقع انترنت ...\n\nوعند موافقه العميل المبدئيه على التصميم يتم ازالة هذا النص من التصميم ويتم وضع النصوص النهائية المطلوبة للتصميم ويقول البعض ان وضع النصوص التجريبية بالتصميم قد تشغل المشاهد عن وضع الكثير من الملاحظات او الانتقادات للتصميم الاساسي.\n\nوخلافاَ للاعتقاد السائد فإن لوريم إيبسوم ليس نصاَ عشوائياً، بل إن له جذور في الأدب اللاتيني الكلاسيكي منذ العام 45 قبل الميلاد. من كتاب \"حول أقاصي الخير والشر';
}
