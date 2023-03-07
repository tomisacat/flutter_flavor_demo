import 'package:flutter/material.dart';

enum Environment { dev, prod }

/// You can attach an InheritedWidget to a BuildContext.
/// This way, you can access this InheritedWidget from
/// any of its descendants in the widget tree.
///
class AppConfig extends InheritedWidget {
  final Environment environment;
  final String appTitle;

  /// The constructor takes required values for environment
  /// and environment-specific properties.
  ///
  /// It also takes a child widget. AppConfig will sit at
  /// the root of your widget tree.
  ///
  const AppConfig({
    super.key,
    required super.child,
    required this.environment,
    required this.appTitle,
  });

  /// The static of function makes it easy to access
  /// the closest instance of AppConfig by searching
  /// the BuildContext parameter and all its parents.
  ///
  /// That’s what BuildContext‘s dependOnInheritedWidgetOfExactType does.
  ///
  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>()!;
  }

  /// The framework calls this function to decide whether
  /// it should notify widgets that use AppConfig when
  /// values inside AppConfig change.
  ///
  /// Since all AppConfig‘s properties are final and
  /// AppConfig is immutable, you can return false.
  ///
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
