import 'package:flutter/material.dart';

/// A utility class for defining and managing application-wide color constants.
///
/// This class provides a centralized place for all fixed color values
/// used throughout the application, ensuring consistency and easy modification.
class AppColors {
  /// Private constructor to prevent instantiation of this utility class.
  const AppColors._();

  /// Primary brand color for the application.
  static const Color primaryColor = Color(0xFF007BFF);

  /// A dark grey color, often used for primary text or icons.
  static const Color darkGrey = Color(0xFF333333);

  /// A lighter grey color, often used for secondary text or hints.
  static const Color lightGrey = Color(0xFFAAAAAA);

  /// Pure white color, commonly used for backgrounds or text on dark surfaces.
  static const Color white = Color(0xFFFFFFFF);

  // Add other application-specific colors here as needed.
  /// Light blue color for gradient background.
  static const Color gradientBlueLight = Color(0xFF63B3ED); // Corresponds to Colors.lightBlue[400]

  /// Darker blue color for gradient background.
  static const Color gradientBlueDark = Color(0xFF3B82F6); // Corresponds to Colors.blue[700]

  /// Background color for the login screen.
  static const Color loginBackgroundColor = Color(0xFF6BB2EE);

  /// Text color for the login button.
  static const Color loginButtonTextColor = Color(0xFF6BB2EE);

  /// Fill color for text fields on the login screen (semi-transparent white).
  static final Color loginTextFieldFillColor = Colors.white.withOpacity(0.1);

  /// Hint text color for text fields on the login screen (light white with transparency).
  static final Color loginTextFieldHintColor = Colors.white.withOpacity(0.7);

  /// Text color for input in text fields on the login screen.
  static const Color loginTextFieldTextColor = Colors.white;

  /// Icon color for text fields on the login screen.
  static const Color loginTextFieldIconColor = Colors.white;
}
