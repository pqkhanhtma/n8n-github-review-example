import 'package:go_router/go_router.dart';
import 'package:n8ndistribution/routes/app_route.dart';
import 'package:n8ndistribution/screens/login_screen.dart'; // New import for LoginScreen

final GoRouter router = GoRouter(
  initialLocation: AppRoute.login.path, // Set the initial route for GoRouter
  routes: <GoRoute>[
    // Existing routes (example, if any)
    // GoRoute(
    //   path: AppRoute.home.path,
    //   name: AppRoute.home.name,
    //   builder: (context, state) => const HomeScreen(),
    // ),

    // New route for LoginScreen
    GoRoute(
      path: AppRoute.login.path,
      name: AppRoute.login.name,
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
