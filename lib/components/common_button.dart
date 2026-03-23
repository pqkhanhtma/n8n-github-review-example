import 'package:flutter/material.dart';

/// A highly configurable common button component.
/// 
/// This component follows atomic design principles and uses Flutter 3.29.0 APIs.
/// It allows customization of text, colors, and size, while handling interactions via callbacks.
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

  /// The border radius of the button corners. Defaults to 8.0.
  final double borderRadius;

  /// The font size of the button text.
  final double? fontSize;

  /// The font weight of the button text.
  final FontWeight? fontWeight;

  const CommonButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height = 48.0,
    this.borderRadius = 8.0,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveBgColor = backgroundColor ?? const Color(0xFF212121);
    final Color effectiveTextColor = textColor ?? const Color(0xFFE0E0E0);

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
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
            return null;
          }),
          elevation: WidgetStateProperty.all<double>(0),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: effectiveTextColor,
                fontWeight: fontWeight ?? FontWeight.w700,
                fontSize: fontSize,
                letterSpacing: 1.2,
              ),
        ),
      ),
    );
  }
}
