import 'package:flutter/material.dart';
import 'package:n8ndistribution/cores/constants/app_colors.dart';

/// A reusable Flutter UI component for text input fields.
class N8nTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSuffixIconPressed;
  final bool isPasswordField;
  final Color? fieldFillColor;
  final BorderRadius? fieldBorderRadius;
  final TextStyle? fieldTextStyle;
  final TextStyle? fieldHintStyle;
  final TextStyle? fieldLabelStyle;
  final Color? fieldIconColor;
  final bool showBorder;
  final BorderSide? fieldBorderSide;
  final Color? fieldTextColor;
  final Color? fieldHintColor;
  final String? semanticsLabel;

  const N8nTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.onSuffixIconPressed,
    this.isPasswordField = false,
    this.fieldFillColor,
    this.fieldBorderRadius,
    this.fieldTextStyle,
    this.fieldHintStyle,
    this.fieldLabelStyle,
    this.fieldIconColor,
    this.showBorder = true,
    this.fieldBorderSide,
    this.fieldTextColor,
    this.fieldHintColor,
    this.semanticsLabel,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius effectiveBorderRadius = fieldBorderRadius ?? BorderRadius.circular(8.0);
    
    final InputBorder effectiveBorder = OutlineInputBorder(
      borderRadius: effectiveBorderRadius,
      borderSide: fieldBorderSide ?? (showBorder ? const BorderSide(color: AppColors.lightGrey) : BorderSide.none),
    );

    final InputBorder effectiveFocusedBorder = OutlineInputBorder(
      borderRadius: effectiveBorderRadius,
      borderSide: fieldBorderSide ?? (showBorder ? const BorderSide(color: AppColors.primaryColor) : BorderSide.none),
    );

    final TextStyle effectiveTextStyle = fieldTextStyle ?? TextStyle(color: fieldTextColor ?? AppColors.darkGrey);
    final TextStyle effectiveHintStyle = fieldHintStyle ?? TextStyle(color: fieldHintColor ?? AppColors.lightGrey);

    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      style: effectiveTextStyle,
      semanticsLabel: semanticsLabel,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: effectiveHintStyle,
        labelText: labelText,
        labelStyle: fieldLabelStyle ?? const TextStyle(color: AppColors.darkGrey),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: fieldIconColor ?? AppColors.darkGrey,
              )
            : null,
        suffixIcon: isPasswordField
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: fieldIconColor ?? AppColors.darkGrey,
                ),
                onPressed: onSuffixIconPressed,
              )
            : null,
        border: effectiveBorder,
        enabledBorder: effectiveBorder,
        focusedBorder: effectiveFocusedBorder,
        filled: true,
        fillColor: fieldFillColor ?? AppColors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
      ),
    );
  }
}
