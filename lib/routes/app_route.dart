/// Model representing a route in the application.
class RoutingModel {
  final String name;
  final String path;

  const RoutingModel({
    required this.name,
    required this.path,
  });
}

/// Centralized route definitions for the application.
class AppRoute {
  static RoutingModel component = const RoutingModel(name: "component", path: "/");
}
