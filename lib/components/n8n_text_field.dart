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
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      style: const TextStyle(color: AppColors.darkGrey), // Text color for user input
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.lightGrey), // Style for placeholder text
        labelText: labelText,
        labelStyle: const TextStyle(color: AppColors.darkGrey), // Style for label text
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: AppColors.darkGrey, // Color for the prefix icon
              )
            : null,
        suffixIcon: isPasswordField
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility, // Toggle icon based on obscureText
                  color: AppColors.darkGrey, // Color for the suffix icon
                ),
                onPressed: onSuffixIconPressed, // Callback for suffix icon press
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.lightGrey), // Default border color
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.lightGrey), // Border color when enabled
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.primaryColor), // Border color when focused
        ),
        filled: true,
        fillColor: AppColors.white, // Background color of the text field
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      ),
    );
  }
}
