import 'package:flutter/material.dart';

/// A reusable atomic button component designed for the project's design system.
/// 
/// This component is stateless and delegates interaction logic to the parent via [onPressed].
/// It uses Flutter 3.29.0 APIs such as [WidgetStateProperty] and [withValues].
class CommonButton extends StatelessWidget {
  /// The text to display inside the button.
  final String text;

  /// Callback function when the button is pressed.
  final VoidCallback? onPressed;

  /// The background color of the button. Defaults to a dark gray.
  final Color? backgroundColor;

  /// The color of the text. Defaults to white.
  final Color? textColor;

  /// The width of the button. If null, it takes the minimum size required by the text.
  final double? width;

  /// The height of the button. Defaults to 48.0.
  final double height;

  /// The border radius of the button. Defaults to 4.0.
  final double borderRadius;

  const CommonButton({
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height = 48.0,
    this.borderRadius = 4.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Design constants based on requirements
    final Color defaultBgColor = const Color(0xFF2D2D2D); // Solid dark gray
    final Color defaultTextColor = Colors.white; // Light gray or white

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              // Using withValues(alpha:) instead of deprecated withOpacity()
              return (backgroundColor ?? defaultBgColor).withValues(alpha: 0.5);
            }
            return backgroundColor ?? defaultBgColor;
          }),
          foregroundColor: WidgetStateProperty.all<Color>(textColor ?? defaultTextColor),
          elevation: WidgetStateProperty.all<double>(0),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 24.0),
          ),
        ),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: textColor ?? defaultTextColor,
            // Thin, sans-serif font style as per description
            fontWeight: FontWeight.w300,
            fontSize: 16,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
