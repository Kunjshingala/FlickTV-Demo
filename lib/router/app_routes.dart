/// Every route in the app, with its URL [path] and a stable [name].
///
/// Navigate by name so call sites never hardcode path strings:
/// `context.goNamed(AppRoute.home.name)`. Adding a screen is one entry here
/// plus one `GoRoute` in app_router.dart.
enum AppRoute {
  home('/', 'home');

  const AppRoute(this.path, this.name);

  /// URL path segment (e.g. `/`, `/settings`, `/gift-card/:id`).
  final String path;

  /// Stable identifier used for name-based navigation.
  final String name;
}
