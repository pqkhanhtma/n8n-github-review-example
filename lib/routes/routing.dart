import 'package:go_router/go_router.dart';
import 'package:n8ndistribution/routes/app_route.dart';
import 'package:n8ndistribution/screens/component_screen.dart';

/// Global router configuration using GoRouter.
final router = GoRouter(
  initialLocation: AppRoute.component.path,
  routes: [
    GoRoute(
      path: AppRoute.component.path,
      name: AppRoute.component.name,
      builder: (context, state) => const ComponentScreen(),
    ),
  ],
);
