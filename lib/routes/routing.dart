import 'package:go_router/go_router.dart';
import 'package:n8ndistribution/routes/app_route.dart';
import 'package:n8ndistribution/screens/login_screen.dart'; // Import the new screen

/// Configures and provides the [GoRouter] instance for the application.
///
/// This file centralizes the routing logic, defining all possible navigation
/// paths and their corresponding screen widgets. It uses [AppRoute] for
/// consistent naming and path management.
class AppRouting {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoute.login.path, // Set login as initial route for testing
    routes: <RouteBase>[
      // Example: GoRoute(
      //   path: AppRoute.home.path,
      //   name: AppRoute.home.name,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const HomeScreen();
      //   },
      // ),
      GoRoute(
        path: AppRoute.login.path,
        name: AppRoute.login.name,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
    ],
  );
}
