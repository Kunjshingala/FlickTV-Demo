import 'package:flutter/widgets.dart';

import 'generated/app_localizations.dart';

export 'generated/app_localizations.dart';

/// Terse, reactive access to localized strings: `context.l10n.brandName`.
///
/// Goes through `AppLocalizations.of`, so each widget that reads it subscribes
/// to locale changes and rebuilds when the language switches.
extension L10nX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
