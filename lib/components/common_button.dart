import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double? width;
  final double? height;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  const CommonButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor = Colors.black87, // Default dark gray background
    this.textColor = Colors.white70, // Default light gray text
    this.width,
    this.height,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w300, // Thin font weight
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          // foregroundColor is typically for text/icon color, but we'll explicitly set it in the Text widget's style
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(4.0), // Default slight curve
          ),
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          elevation: 0, // Explicitly set elevation to 0 for a "solid" look as per description
        ),
        child: Text(
          text.toUpperCase(), // Ensure text is uppercase as per description
          style: TextStyle(
            color: textColor, // Explicitly set text color
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
