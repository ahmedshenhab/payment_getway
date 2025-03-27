import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) =>
      Navigator.pushNamed(this, routeName, arguments: arguments);

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: arguments);

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    bool predicate = false,
  }) => Navigator.pushNamedAndRemoveUntil(
    this,
    routeName,
    (route) => predicate,

    arguments: arguments,
  );

  void pop() => Navigator.pop(this);
}
