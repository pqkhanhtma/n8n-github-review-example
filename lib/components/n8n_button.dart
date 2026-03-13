import 'package:flutter/material.dart';

/// A highly customizable common button component for the n8ndistribution application.
///
/// This button allows for extensive customization of its appearance and behavior,
/// including text, colors, size, border radius, text style, padding, and elevation.
/// All user interactions are handled via callbacks to maintain separation of concerns.
class N8nButton extends StatelessWidget {
  /// The text displayed on the button.
  final String text;

  /// The callback function to be called when the button is pressed.
  /// If null, the button will be disabled.
  final VoidCallback? onPressed;

  /// The background color of the button.
  /// Defaults to `Theme.of(context).primaryColor`.
  final Color? backgroundColor;

  /// The color of the button's text.
  /// Defaults to `Colors.white`.
  final Color? textColor;

  /// The width of the button.
  /// Defaults to `double.infinity` (full width).
  final double? width;

  /// The height of the button.
  /// Defaults to `56.0`.
  final double? height;

  /// The border radius of the button's corners.
  /// Defaults to `BorderRadius.circular(8.0)`.
  final BorderRadius? borderRadius;

  /// Custom text style for the button's label.
  /// If provided, it overrides the default text style and `textColor`.
  final TextStyle? textStyle;

  /// The internal padding of the button.
  /// Defaults to the `ElevatedButton`'s default padding.
  final EdgeInsetsGeometry? padding;

  /// The elevation of the button, controlling its shadow.
  /// Defaults to `0.0` for a flat appearance.
  final double? elevation;

  /// Creates a customizable N8nButton.
  const N8nButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.borderRadius,
    this.textStyle,
    this.padding,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    // Define default values for various button properties
    final Color defaultBackgroundColor = Theme.of(context).primaryColor;
    const Color defaultTextColor = Colors.white;
    const double defaultHeight = 56.0;
    final BorderRadius defaultBorderRadius = BorderRadius.circular(8.0);
    const double defaultElevation = 0.0; // Image suggests a relatively flat button

    return SizedBox(
      width: width ?? double.infinity, // Use provided width or full width
      height: height ?? defaultHeight, // Use provided height or default height
      child: ElevatedButton(
        onPressed: onPressed, // Callback for button press
        style: ButtonStyle(
          // Resolve background color based on button state (e.g., disabled)
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                // Dim the background color when the button is disabled
                return (backgroundColor ?? defaultBackgroundColor).withOpacity(0.5);
              }
              return backgroundColor ?? defaultBackgroundColor;
            },
          ),
          // Resolve foreground color (text and splash) based on button state
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                // Dim the text color when the button is disabled
                return (textColor ?? defaultTextColor).withOpacity(0.5);
              }
              return textColor ?? defaultTextColor;
            },
          ),
          // Define the button's shape with customizable border radius
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? defaultBorderRadius,
            ),
          ),
          // Define the button's elevation (shadow)
          elevation: MaterialStateProperty.all<double?>(elevation ?? defaultElevation),
          // Define the button's internal padding
          padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(padding),
          // Resolve text style based on button state and provided properties
          textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
            (Set<MaterialState> states) {
              // If a custom textStyle is provided, it takes precedence.
              if (textStyle != null) {
                return textStyle;
              }
              // Otherwise, derive from the theme's labelLarge style.
              // Apply custom color and bold weight.
              return Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: textColor ?? defaultTextColor,
                    fontWeight: FontWeight.bold,
                  ) ??
                  // Fallback to a default TextStyle if labelLarge is not defined in the theme
                  const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: defaultTextColor,
                  );
            },
          ),
        ),
        child: Text(text), // Display the button's text
      ),
    );
  }
}