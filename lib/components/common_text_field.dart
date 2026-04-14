import 'package:flutter/material.dart';

/// A reusable atomic text field component that supports normal input and password modes.
/// 
/// This component is stateless and relies on callbacks to handle text changes and 
/// visibility toggling, ensuring strict separation of concerns.
class CommonTextField extends StatelessWidget {
  /// The text to display when the field is empty.
  final String? hintText;

  /// The controller for the text field.
  final TextEditingController? controller;

  /// Whether this field should obscure text (e.g., for passwords).
  final bool isPassword;

  /// Whether the text is currently obscured. Managed by the parent screen.
  final bool obscureText;

  /// Optional icon to display at the start of the field.
  final IconData? prefixIcon;

  /// Callback triggered whenever the text content changes.
  final ValueChanged<String>? onChanged;

  /// Callback triggered when the visibility toggle icon is pressed.
  final VoidCallback? onToggleVisibility;

  /// The type of keyboard to display.
  final TextInputType keyboardType;

  const CommonTextField({
    super.key,
    this.hintText,
    this.controller,
    this.isPassword = false,
    this.obscureText = false,
    this.prefixIcon,
    this.onChanged,
    this.onToggleVisibility,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    // Design constants based on requirements
    const Color backgroundColor = Color(0xFFF5F5F5); // Very light grey
    const Color iconColor = Color(0xFF424242); // Dark grey
    const Color hintColor = Color(0xFF9E9E9E); // Light grey

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        obscureText: isPassword ? obscureText : false,
        keyboardType: keyboardType,
        style: Theme.of(context).textTheme.bodyLarge,
        cursorColor: iconColor,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: hintColor,
              ),
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: iconColor,
                  size: 20,
                )
              : null,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    // Using withValues(alpha:) instead of deprecated withOpacity()
                    color: iconColor.withValues(alpha: 0.7),
                  ),
                  onPressed: onToggleVisibility,
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          // Ensure the prefix icon is centered vertically
          isDense: true,
        ),
      ),
    );
  }
}
