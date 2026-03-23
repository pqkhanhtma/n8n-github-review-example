/// Model representing a route in the application.
class RoutingModel {
  final String name;
  final String path;

  const RoutingModel({
    required this.name,
    required this.path,
  });
}

/// Centralized route definitions.
class AppRoute {
  static RoutingModel login = const RoutingModel(name: "login", path: "/");
  static RoutingModel component = const RoutingModel(name: "component", path: "/component");
}
