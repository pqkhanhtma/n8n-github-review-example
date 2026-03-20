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
  final double? elevation;
  final Color? shadowColor;

  const CommonButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor = Colors.black87,
    this.textColor = Colors.white70,
    this.width,
    this.height,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w300,
    this.padding,
    this.borderRadius,
    this.elevation = 0,
    this.shadowColor,
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
          shadowColor: shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(4.0),
          ),
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          elevation: elevation,
        ),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
