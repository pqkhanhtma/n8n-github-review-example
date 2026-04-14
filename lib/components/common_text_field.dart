import 'package:flutter/material.dart';

/// A customizable text input component that supports normal text and password modes.
///
/// This component follows the atomic design principle and is stateless.
/// All state changes (text input, visibility toggling) are handled via callbacks.
class CommonTextField extends StatelessWidget {
  /// The text to display when the field is empty.
  final String? hintText;

  /// The controller for the text field.
  final TextEditingController? controller;

  /// Whether this is a password field.
  final bool isPassword;

  /// Whether the text should be obscured. 
  /// Managed by the parent screen when [isPassword] is true.
  final bool obscureText;

  /// Icon to display at the start of the field.
  final Widget? prefixIcon;

  /// Callback function triggered when the text changes.
  final ValueChanged<String>? onChanged;

  /// Callback function triggered when the password visibility icon is pressed.
  final VoidCallback? onToggleVisibility;

  /// The type of keyboard to display.
  final TextInputType keyboardType;

  /// The visual density of the text field.
  final VisualDensity? visualDensity;

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
    this.visualDensity,
  });

  @override
  Widget build(BuildContext context) {
    // Design constants based on requirements
    const Color backgroundColor = Color(0xFFF5F5F5); // Very light grey
    const Color iconColor = Color(0xFF424242); // Dark grey
    const Color hintColor = Color(0xFF9E9E9E); // Light grey

    return TextField(
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
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: IconTheme(
                  data: const IconThemeData(
                    color: iconColor,
                    size: 20,
                  ),
                  child: prefixIcon!,
                ),
              )
            : null,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 40,
          minHeight: 40,
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  // Use withValues(alpha:) instead of deprecated withOpacity()
                  color: iconColor.withValues(alpha: 0.6),
                ),
                onPressed: onToggleVisibility,
              )
            : null,
        filled: true,
        fillColor: backgroundColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: iconColor.withValues(alpha: 0.2),
            width: 1.5,
          ),
        ),
        visualDensity: visualDensity,
      ),
    );
  }
}
