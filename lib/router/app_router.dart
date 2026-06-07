import 'package:go_router/go_router.dart';

import '../screen/home/home.dart';
import 'app_routes.dart';

/// The app's single [GoRouter]. Keep this list as the one source of truth for
/// navigation — every screen is registered here against an [AppRoute] entry.
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoute.home.path,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoute.home.path,
        name: AppRoute.home.name,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
