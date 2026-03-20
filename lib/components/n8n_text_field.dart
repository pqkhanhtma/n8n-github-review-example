import 'package:flutter/material.dart';
import 'package:n8ndistribution/cores/constants/app_colors.dart';

/// A reusable Flutter UI component for text input fields.
///
/// This widget supports both standard text input and password input fields.
/// For password fields, it provides an optional suffix icon to toggle
/// content visibility. All user interactions, such as text changes and
/// suffix icon presses, are handled via callbacks to maintain separation
/// of concerns and allow state management at the screen level.
class N8nTextField extends StatelessWidget {
  /// The controller for the text field, used to manage and retrieve the text.
  final TextEditingController controller;

  /// The placeholder text displayed when the text field is empty.
  final String hintText;

  /// An optional label text that floats above the text field when focused.
  final String? labelText;

  /// An optional icon displayed at the beginning of the text field.
  final IconData? prefixIcon;

  /// The type of keyboard to use for editing the text.
  final TextInputType keyboardType;

  /// Whether the text field should obscure the text being entered.
  /// This is typically used for password fields.
  final bool obscureText;

  /// A callback function that is called whenever the text field's content changes.
  /// It provides the current text as a [String] argument.
  final ValueChanged<String>? onChanged;

  /// A callback function that is called when the suffix icon is pressed.
  /// This is primarily used for toggling password visibility.
  final VoidCallback? onSuffixIconPressed;

  /// A flag indicating if this text field should behave as a password field.
  /// If true, a suffix icon for visibility toggle will be shown.
  final bool isPasswordField;

  // --- New parameters for customization ---
  /// Custom fill color for the text field background.
  final Color? fieldFillColor;

  /// Custom border radius for the text field.
  final BorderRadius? fieldBorderRadius;

  /// Custom text style for the user input.
  final TextStyle? fieldTextStyle;

  /// Custom text style for the hint text.
  final TextStyle? fieldHintStyle;

  /// Custom text style for the label text.
  final TextStyle? fieldLabelStyle;

  /// Custom color for prefix and suffix icons.
  final Color? fieldIconColor;

  /// Whether to show the default OutlineInputBorder or use InputBorder.none.
  final bool showBorder;

  /// Custom color for the input text. Overrides [fieldTextStyle.color] if both are provided.
  final Color? fieldTextColor;

  /// Custom color for the hint text. Overrides [fieldHintStyle.color] if both are provided.
  final Color? fieldHintColor;

  /// A semantic description of the text field's purpose for accessibility.
  final String? semanticsLabel;

  /// Custom content padding.
  final EdgeInsetsGeometry? contentPadding;

  /// Creates an [N8nTextField] widget.
  const N8nTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false, // Default to false for non-password fields
    this.onChanged,
    this.onSuffixIconPressed,
    this.isPasswordField = false, // Default to false for standard input
    // New parameters
    this.fieldFillColor,
    this.fieldBorderRadius,
    this.fieldTextStyle,
    this.fieldHintStyle,
    this.fieldLabelStyle,
    this.fieldIconColor,
    this.showBorder = true, // Default to true to maintain existing behavior
    this.fieldTextColor,
    this.fieldHintColor,
    this.semanticsLabel,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius effectiveBorderRadius = fieldBorderRadius ?? BorderRadius.circular(8.0);
    final InputBorder effectiveBorder = showBorder
        ? OutlineInputBorder(
            borderRadius: effectiveBorderRadius,
            borderSide: const BorderSide(color: AppColors.lightGrey),
          )
        : InputBorder.none;

    final InputBorder effectiveFocusedBorder = showBorder
        ? OutlineInputBorder(
            borderRadius: effectiveBorderRadius,
            borderSide: const BorderSide(color: AppColors.primaryColor),
          )
        : InputBorder.none;

    // Determine the effective text style, prioritizing fieldTextStyle, then fieldTextColor, then default.
    final TextStyle effectiveTextStyle = fieldTextStyle ?? TextStyle(color: fieldTextColor ?? AppColors.darkGrey);
    // Determine the effective hint style, prioritizing fieldHintStyle, then fieldHintColor, then default.
    final TextStyle effectiveHintStyle = fieldHintStyle ?? TextStyle(color: fieldHintColor ?? AppColors.lightGrey);

    return TextField(      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      style: effectiveTextStyle, // Use effective text style
      semanticsLabel: semanticsLabel, // Pass semanticsLabel
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: effectiveHintStyle, // Use effective hint style
        labelText: labelText,
        labelStyle: fieldLabelStyle ?? const TextStyle(color: AppColors.darkGrey), // Use custom or default
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: fieldIconColor ?? AppColors.darkGrey, // Use custom or default
              )
            : null,
        suffixIcon: isPasswordField
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility, // Toggle icon based on obscureText
                  color: fieldIconColor ?? AppColors.darkGrey, // Use custom or default
                ),
                onPressed: onSuffixIconPressed, // Callback for suffix icon press
              )
            : null,
        border: effectiveBorder,
        enabledBorder: effectiveBorder,
        focusedBorder: effectiveFocusedBorder,
        filled: true,
        fillColor: fieldFillColor ?? AppColors.white, // Use custom or default
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      ),
    );
  }
}
