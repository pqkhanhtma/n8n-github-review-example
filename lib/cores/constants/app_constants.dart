import 'package:flutter/material.dart';

/// A collection of application-wide constants.
///
/// This class centralizes various fixed values used throughout the application,
/// promoting consistency and easier maintenance. It includes general UI dimensions,
/// and specific values for different screens or components.
class AppConstants {
  // General UI Dimensions
  static const double defaultLabelBottomPadding = 8.0;
  static const double defaultTextFieldContentPadding = 16.0;
  static const double defaultBorderRadius = 12.0;

  // Login Screen Specific Constants
  static const double loginScreenHorizontalPadding = 24.0;
  static const double loginScreenVerticalSpacing = 24.0;
  static const double loginScreenLogoHeight = 80.0;
  static const double loginScreenButtonHeight = 56.0;
  static const double loginScreenButtonBorderRadius = 12.0;
  static const double loginScreenTitleFontSize = 32.0;
  static const double loginScreenSubtitleFontSize = 16.0;
  static const double loginScreenSmallTextFontSize = 14.0;

  // Colors (Approximated from design)
  static const Color loginScreenPrimaryTextColor = Colors.white;
  static const Color loginScreenSecondaryTextColor = Colors.white70;
  static const Color loginScreenTextFieldFillColor = Color(0xFF2C2C2C); // Dark grey
  static const Color loginScreenTextFieldBorderColor = Colors.white30; // Light grey transparent
  static const Color loginScreenButtonGradientStart = Color(0xFF6A1B9A); // Dark purple
  static const Color loginScreenButtonGradientEnd = Color(0xFF42A5F5); // Light blue
  static const Color loginScreenBackgroundColor = Color(0xFF1A1A2E); // Very dark blue/purple for background

  // Asset Paths (Placeholders - ensure these assets are added to pubspec.yaml)
  static const String loginScreenLogoAsset = 'assets/images/logo.png';
  static const String loginScreenBackgroundAsset = 'assets/images/background.png';
}
