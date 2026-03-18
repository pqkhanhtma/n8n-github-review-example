import 'package:flutter/material.dart';

// Constants for default values. These are kept internal to the component
// for this specific task to avoid creating new files outside the component scope.
// In a larger project, these would typically reside in a shared theme or constants file.
const double _kDefaultButtonHeight = 50.0;
const double _kDefaultButtonFontSize = 16.0;
const double _kDefaultButtonBorderRadius = 8.0;
const double _kDefaultButtonElevation = 2.0;
const EdgeInsetsGeometry _kDefaultButtonPadding =
    EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);

/// A highly customizable common button component designed for reusability.
///
/// This widget allows for flexible configuration of its appearance and behavior,
/// including text, colors, dimensions, leading icon, and an action callback.
/// It adheres to clean architecture principles by handling all user interactions
/// via callbacks, ensuring separation of concerns.
class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final IconData? icon;
  final Color? iconColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? elevation;

  /// Creates a customizable common button component.
  ///
  /// The [text] is the label displayed on the button.
  /// The [onPressed] callback is invoked when the button is tapped.
  /// If [onPressed] is null, the button will be disabled.
  ///
  /// [backgroundColor] defines the button's background color. Defaults to
  /// `Theme.of(context).primaryColor` if not provided.
  /// [textColor] defines the color of the button's text. Defaults to `Colors.white`.
  /// [width] and [height] control the button's dimensions. [width] defaults to `double.infinity`
  /// (full width) if not specified.
  /// [fontSize] controls the size of the button's text.
  /// [icon] allows adding an optional leading icon to the button.
  /// [iconColor] defines the color of the icon. Defaults to [textColor] if not provided.
  /// [borderRadius] customizes the button's corner radius.
  /// [padding] sets the internal padding of the button.
  /// [elevation] controls the button's shadow.
  const CommonButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.fontSize,
    this.icon,
    this.iconColor,
    this.borderRadius,
    this.padding,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    // Determine effective values, falling back to defaults or theme values
    final Color effectiveBackgroundColor =
        backgroundColor ?? Theme.of(context).primaryColor;
    final Color effectiveTextColor = textColor ?? Colors.white;
    final Color effectiveIconColor = iconColor ?? effectiveTextColor;
    final BorderRadius effectiveBorderRadius =
        borderRadius ?? BorderRadius.circular(_kDefaultButtonBorderRadius);
    final double effectiveElevation = elevation ?? _kDefaultButtonElevation;
    final double effectiveHeight = height ?? _kDefaultButtonHeight;
    final double effectiveFontSize = fontSize ?? _kDefaultButtonFontSize;
    final EdgeInsetsGeometry effectivePadding = padding ?? _kDefaultButtonPadding;

    return SizedBox(
      width: width ?? double.infinity, // Default to full width if not specified
      height: effectiveHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: effectiveBackgroundColor,
          foregroundColor: effectiveTextColor, // Used for ripple effect and default text/icon color
          elevation: effectiveElevation,
          shape: RoundedRectangleBorder(
            borderRadius: effectiveBorderRadius,
          ),
          padding: effectivePadding,
          textStyle: TextStyle(
            fontSize: effectiveFontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Keep content size to minimum needed
          mainAxisAlignment: MainAxisAlignment.center, // Center content horizontally within the button
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: effectiveIconColor,
                size: effectiveFontSize * 1.2, // Scale icon size relative to font size
              ),
              const SizedBox(width: 8.0), // Space between icon and text
            ],
            Text(
              text,
              style: TextStyle(
                color: effectiveTextColor, // Explicitly set text color
                fontSize: effectiveFontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
