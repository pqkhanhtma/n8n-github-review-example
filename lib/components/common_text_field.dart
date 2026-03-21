import 'package:flutter/material.dart';

/// A highly configurable common text field component.
/// 
/// This component supports both normal text input and password modes with visibility toggling.
/// It follows Flutter 3.29.0 standards and ensures state is managed via callbacks.
class CommonTextField extends StatelessWidget {
  /// The text to display when the field is empty.
  final String? hintText;

  /// Controller for the text field.
  final TextEditingController? controller;

  /// Whether this is a password field.
  final bool isPassword;

  /// Whether the text should be obscured (used when [isPassword] is true).
  final bool obscureText;

  /// Icon to display at the start of the field.
  final Widget? prefixIcon;

  /// Callback triggered when the visibility toggle icon is pressed.
  final VoidCallback? onToggleVisibility;

  /// Callback triggered when the text changes, returning the current content.
  final ValueChanged<String>? onChanged;

  /// The type of information for which to optimize the text input control.
  final TextInputType? keyboardType;

  /// The action the user takes when finishing editing.
  final TextInputAction? textInputAction;

  /// The background color of the text field.
  final Color? backgroundColor;

  const CommonTextField({
    super.key,
    this.hintText,
    this.controller,
    this.isPassword = false,
    this.obscureText = false,
    this.prefixIcon,
    this.onToggleVisibility,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // Using modern TextTheme naming conventions (Flutter 3.29.0)
    final TextStyle? textStyle = Theme.of(context).textTheme.bodyLarge;
    final TextStyle? hintStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          // Using withValues(alpha:) instead of deprecated withOpacity()
          color: Theme.of(context).hintColor.withValues(alpha: 0.7),
        );

    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: isPassword ? obscureText : false,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: textStyle,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  size: 22,
                  color: Theme.of(context).iconTheme.color?.withValues(alpha: 0.7),
                ),
                onPressed: onToggleVisibility,
                // Modern interaction feedback
                splashColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                highlightColor: Colors.transparent,
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        filled: true,
        fillColor: backgroundColor ?? 
            (Theme.of(context).brightness == Brightness.light
                ? const Color(0xFFF5F5F5)
                : const Color(0xFF2C2C2C)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
