import 'package:flutter/material.dart';

class RoutingModel {
  final String name;
  final String path;

  const RoutingModel({required this.name, required this.path});
}

@immutable
class AppRoute {
  const AppRoute._();

  static RoutingModel login = const RoutingModel(name: "login", path: "/login");
}
