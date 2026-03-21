import 'package:flutter/material.dart';

/// A reusable, atomic button component designed for flexibility and scalability.
/// 
/// This component follows the Flutter 3.29.0 standards, utilizing [WidgetStateProperty]
/// and modern [TextTheme] naming conventions.
class CommonButton extends StatelessWidget {
  /// The text to display inside the button.
  final String text;

  /// Callback function triggered when the button is pressed.
  final VoidCallback? onPressed;

  /// The background color of the button.
  final Color? backgroundColor;

  /// The color of the text inside the button.
  final Color? textColor;

  /// The width of the button. If null, it will wrap its content or expand based on constraints.
  final double? width;

  /// The height of the button. Defaults to 48.0.
  final double height;

  /// The border radius of the button corners. Defaults to 4.0.
  final double borderRadius;

  const CommonButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height = 48.0,
    this.borderRadius = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    // Default colors based on the requirement: dark grey background and white text.
    final Color effectiveBgColor = backgroundColor ?? const Color(0xFF333333);
    final Color effectiveTextColor = textColor ?? Colors.white;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          // Using WidgetStateProperty instead of deprecated MaterialStateProperty
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              // Using withValues(alpha:) instead of deprecated withOpacity()
              return effectiveBgColor.withValues(alpha: 0.5);
            }
            return effectiveBgColor;
          }),
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return effectiveTextColor.withValues(alpha: 0.5);
            }
            return effectiveTextColor;
          }),
          overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
            if (states.contains(WidgetState.pressed)) {
              return effectiveTextColor.withValues(alpha: 0.1);
            }
            if (states.contains(WidgetState.hovered)) {
              return effectiveTextColor.withValues(alpha: 0.05);
            }
            return null;
          }),
          elevation: WidgetStateProperty.all<double>(0),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: effectiveTextColor,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
        ),
      ),
    );
  }
}
