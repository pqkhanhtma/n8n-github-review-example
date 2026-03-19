import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:n8ndistribution/routes/app_route.dart';
import 'package:n8ndistribution/screens/login_screen.dart'; // Import the new screen

class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: AppRoute.initial.path,
    routes: [
      GoRoute(
        path: AppRoute.initial.path,
        name: AppRoute.initial.name,
        builder: (context, state) => const Text('Initial Screen'), // Placeholder
      ),
      // ADD NEW ROUTES BELOW
      GoRoute(
        path: AppRoute.login.path,
        name: AppRoute.login.name,
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
}