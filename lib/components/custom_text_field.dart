import 'package:flutter/material.dart';

/// A reusable and configurable text input field component.
///
/// This widget can function as a regular text input or a password field.
/// For password fields, it includes an icon to toggle content visibility.
/// All user interactions, such as typing and password visibility toggling,
/// are handled via callbacks to maintain separation of concerns and allow
/// state management at the screen level.
class CustomTextField extends StatelessWidget {
  /// The text to display above the input field.
  final String? labelText;

  /// The text to display when the input field is empty.
  final String? hintText;

  /// A callback function that is called whenever the text field's content changes.
  /// It provides the current value of the text field.
  final ValueChanged<String>? onChanged;

  /// Determines if the text field should behave as a password input.
  /// If true, it will show a visibility toggle icon.
  final bool isPassword;

  /// Controls whether the text content is obscured (e.g., for password masking).
  /// This state should be managed by the parent widget.
  final bool obscureText;

  /// A callback function that is called when the password visibility toggle icon is pressed.
  /// This allows the parent widget to update the `obscureText` state.
  final VoidCallback? onTogglePasswordVisibility;

  /// An optional controller for the text field, allowing programmatic control of its content.
  final TextEditingController? controller;

  /// The type of keyboard to display for the text input.
  final TextInputType keyboardType;

  /// A validator function that checks the input for errors.
  /// It returns an error string if the input is invalid, or null if valid.
  final FormFieldValidator<String>? validator;

  /// An optional widget to display before the input area (e.g., an icon).
  final Widget? prefixIcon;

  /// An optional widget to display after the input area.
  /// If `isPassword` is true, this will be overridden by the visibility toggle icon.
  final Widget? suffixIcon;

  /// Creates a [CustomTextField] widget.
  const CustomTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.isPassword = false,
    this.obscureText = false,
    this.onTogglePasswordVisibility,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      // Obscure text only if it's a password field and obscureText is true
      obscureText: isPassword ? obscureText : false,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        // Display password visibility toggle icon if it's a password field,
        // otherwise use the provided suffixIcon.
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: onTogglePasswordVisibility,
              )
            : suffixIcon,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      ),
    );
  }
}
