import 'package:flutter/material.dart';

/// A highly customizable button component designed for reusability and flexibility.
///
/// This widget provides options to configure its text, background color, text color,
/// dimensions (width and height), border radius, internal padding, and text style.
/// All interactions are handled via the `onPressed` callback, ensuring a clean
/// separation of concerns and adherence to component architecture principles.
class CustomButton extends StatelessWidget {
  /// The text displayed on the button.
  final String text;

  /// The callback function to be executed when the button is pressed.
  /// If null, the button will be disabled.
  final VoidCallback? onPressed;

  /// The background color of the button.
  /// Defaults to `Theme.of(context).primaryColor` if not provided.
  final Color? backgroundColor;

  /// The color of the text displayed on the button.
  /// Defaults to `Theme.of(context).colorScheme.onPrimary` if not provided.
  final Color? textColor;

  /// The desired width of the button.
  /// Defaults to `double.infinity` (full width) if not provided.
  final double? width;

  /// The desired height of the button.
  /// Defaults to `50.0` if not provided.
  final double? height;

  /// The border radius for the button's corners.
  /// Defaults to `BorderRadius.circular(8.0)` if not provided.
  final BorderRadius? borderRadius;

  /// The internal padding of the button's child (text).
  /// If null, `ElevatedButton`'s default padding will be used.
  final EdgeInsetsGeometry? padding;

  /// The text style for the button's label.
  /// Defaults to `Theme.of(context).textTheme.labelLarge` with `textColor` applied
  /// if not provided.
  final TextStyle? textStyle;

  /// Creates a [CustomButton] widget.
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.borderRadius,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultTextColor = theme.colorScheme.onPrimary;

    return SizedBox(
      width: width ?? double.infinity, // Default to full width
      height: height ?? 50.0, // Default height
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? theme.primaryColor,
          foregroundColor: textColor ?? defaultTextColor, // Controls text/icon color and ripple effect
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          ),
          padding: padding,
        ),
        child: Text(
          text,
          style: (textStyle ?? theme.textTheme.labelLarge)?.copyWith(
            color: textColor ?? defaultTextColor, // Ensures text color is applied consistently
          ),
        ),
      ),
    );
  }
}
