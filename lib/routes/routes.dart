// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

/// A utility class that holds screen names for named navigation.
/// This class has no constructor and all variables are `static`.
@immutable
class Routes {
  const Routes._();

  /// The name of the route for all pages screen
  static const String AllPagesScreen = '/all-pages-screen';

  /// The name of the route for home screen.
  static const String HomeScreen = '/home-screen';

  /// The name of the route for auth screen.
  static const String AuthScreen = '/auth-screen';

  /// The name of the route for form screen
  static const String FormScreen = '/form-screen';

  /// The name of the route for second form screen
  static const String SecondFormScreen = '/second-form-screen';

  /// The name of the route for search screen
  static const String SearchScreen = '/search-screen';

  /// The name of the route for requirement screen.
  static const String RequirementScreen = '/requirement-screen';
}
