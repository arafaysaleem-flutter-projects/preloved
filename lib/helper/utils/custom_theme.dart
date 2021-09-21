import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

/// A utility class that holds themes for the app.
/// This class has no constructor and all methods are `static`.
@immutable
class CustomTheme {
  const CustomTheme._();

  /// The main starting theme for the app.
  ///
  /// Sets the following defaults:
  /// * primaryColor: [AppColors.primaryColor],
  /// * scaffoldBackgroundColor: [AppColors.scaffoldColor],
  /// * fontFamily: [AppColors.poppinsFont].fontFamily,
  /// * iconTheme: [Colors.white] for default icon
  /// * textButtonTheme: [TextButtonTheme] without the default padding,
  static late final mainTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    accentColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: AppFonts.conduit,
    textTheme: Typography().black,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
