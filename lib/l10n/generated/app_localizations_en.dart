// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Flick TV Example';

  @override
  String get brandName => 'blinkit';

  @override
  String get brandMoney => 'Money';

  @override
  String get feature1Title => 'Single tap payments';

  @override
  String get feature1Message =>
      'Enjoy seamless payment without the wait for OTPs';

  @override
  String get feature2Title => 'Zero Failure';

  @override
  String get feature2Message =>
      'Zero payment failures ensure you never miss an order';

  @override
  String get feature3Title => 'Real-time refunds';

  @override
  String get feature3Message =>
      'No Need to wait for refunds. Blinkit money refunds are instant!';

  @override
  String get addMoney => 'Add Money';

  @override
  String get claimGiftCardTitle => 'Claim Gift Card';

  @override
  String get claimGiftCardMessage =>
      'Enter gift card details to claim your gift card';

  @override
  String get tagline => 'Enjoy seamless \n one tap payments';
}
