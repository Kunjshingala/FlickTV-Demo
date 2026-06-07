import 'dart:ui';

/// Raw palette — the single source of truth for hex values.
///
/// Prefer reading semantic tokens via `context.appColors` (see theme.dart).
/// These consts remain for `const` contexts (e.g. CustomPainter defaults)
/// where a BuildContext isn't available.
const colorPrimary = Color(0xFF9D9663);
const colorBorder = Color(0xFF9D9663);
const colorSuccess = Color(0xFF1B8F20);
