import 'package:flutter/material.dart';

/// A reusable button component that follows the project's design system.
/// 
/// This component supports custom colors, text, and sizing, and uses 
/// Flutter 3.29.0 APIs like [WidgetStateProperty] and [withValues].
class CommonButton extends StatelessWidget {
  /// The text to be displayed on the button.
  final String text;

  /// The callback that is called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// The background color of the button. Defaults to a dark grey.
  final Color? backgroundColor;

  /// The color of the text outline. Defaults to white.
  final Color? textColor;

  /// The width of the button. If null, it will expand to fill its parent.
  final double? width;

  /// The height of the button. Defaults to 50.0.
  final double height;

  /// The border radius of the button. Defaults to 0.0 for a rectangular look.
  final double borderRadius;

  const CommonButton({
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height = 50.0,
    this.borderRadius = 0.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Use a dark grey as the default background color (e.g., #212121)
    final Color effectiveBgColor = backgroundColor ?? const Color(0xFF212121);
    // Use white as the default text color for the outline
    final Color effectiveTextColor = textColor ?? Colors.white;

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              // Use withValues(alpha:) instead of deprecated withOpacity()
              return effectiveBgColor.withValues(alpha: 0.5);
            }
            return effectiveBgColor;
          }),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          elevation: WidgetStateProperty.all<double>(0),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        ),
        child: Text(
          text.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.0,
            // Creating the "outlined" font effect as per the requirement
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1.2
              ..color = effectiveTextColor,
          ),
        ),
      ),
    );
  }
}
