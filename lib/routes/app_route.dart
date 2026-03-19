import 'package:flutter/material.dart';

class RoutingModel {
  final String name;
  final String path;

  const RoutingModel({required this.name, required this.path});
}

class AppRoute {
  const AppRoute._();

  static RoutingModel initial = const RoutingModel(name: "initial", path: "/");
  // ADD NEW ROUTING MODELS BELOW
  static RoutingModel login = const RoutingModel(name: "login", path: "/login");
}
