import 'package:flutter/material.dart';

/// A model representing a routing entry in the application.
///
/// This class encapsulates the name and path for a specific route,
/// making it easier to manage and reference routes throughout the app.
class RoutingModel {
  final String name;
  final String path;

  const RoutingModel({
    required this.name,
    required this.path,
  });
}

/// Defines all application routes using [RoutingModel].
///
/// This class serves as a central registry for all named routes,
/// ensuring consistency and easy access to route information.
class AppRoute {
  // Example: static RoutingModel home = const RoutingModel(name: "home", path: "/home");

  static RoutingModel login = const RoutingModel(name: "login", path: "/login");
}
