import 'package:go_router/go_router.dart';
import 'package:n8ndistribution/routes/app_route.dart';
import 'package:n8ndistribution/screens/login_screen.dart';
import 'package:n8ndistribution/screens/component_screen.dart';

/// Global router configuration.
final router = GoRouter(
  initialLocation: AppRoute.login.path,
  routes: [
    GoRoute(
      path: AppRoute.login.path,
      name: AppRoute.login.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoute.component.path,
      name: AppRoute.component.name,
      builder: (context, state) => const ComponentScreen(),
    ),
  ],
);
